//
//  MyNotificationsListViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MyNotificationsListViewController: BaseViewController {
    var myNotificationsHeader: ObjectLabelTag!
    var myNotificationsTableView: NotificationsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Notifications"
        self.view.backgroundColor = UIColor.white
        setupViews()
        loadMyNotificationsList()
    }
    
    func setupViews() {
        myNotificationsHeader = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 40), withLabel: "My Notifications")
        myNotificationsTableView = NotificationsTableView(frame: CGRect(x: self.view.frame.minX, y: myNotificationsHeader.frame.maxY, width: self.view.frame.width, height: 550), notificationsList: [], notificationSelectedCallback: { (notification) in
            //            let eventDetailsViewController = EventDetailsViewController()
            //            eventDetailsViewController.event = event
            //            self.navigationController?.pushViewController(eventDetailsViewController, animated: true)
        })
        
        self.view.addSubview(myNotificationsHeader)
        self.view.addSubview(myNotificationsTableView)
    }
    
    func loadMyNotificationsList() {
        var newNotifications: [Notification] = []
        var numberOfNotificationsToLoad = 0
        if (UserSession.user.events_going.count <= UserSession.defaultLoadCountEvents) {
            numberOfNotificationsToLoad = UserSession.user.events_going.count - 1
        } else {
            numberOfNotificationsToLoad = UserSession.defaultLoadCountEvents
        }
        if (numberOfNotificationsToLoad > 0) {
            for index in 0...numberOfNotificationsToLoad {
                //ActivityHelper.startActivity(view: self.view)
                let getEventRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String(UserSession.user.events_going[index]), methodType: "GET", postContent: nil)
                if (getEventRequest != nil) {
                    APIDelegate.performTask(withRequest: getEventRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newNotifications.append(try Notification(json: json![0])!)
                                self.myNotificationsTableView.reloadNotifications(notifications: newNotifications)
                            } catch {
                                print(error)
                            }
                        }
                    })
                } else {
                    //|||||||||ActivityHelper.stopActivity(view: self.view)
                }
            }
        }
    }
}
