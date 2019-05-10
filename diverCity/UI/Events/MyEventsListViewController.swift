//
//  MyEventsListViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MyEventsListViewController: BaseViewController {
    var myEventsTag: ObjectLabelTag!
    var myEventsTableView: EventsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Event"
        self.view.backgroundColor = UIColor.white
        setupViews()
        loadMyEventsList()
    }
    
    func setupViews() {
        myEventsTag = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 40), withLabel: "My Events")
        myEventsTableView = EventsTableView(frame: CGRect(x: self.view.frame.minX, y: myEventsTag.frame.maxY, width: self.view.frame.width, height: 550), eventsList: [], eventSelectedCallback: { (event) in
            let eventDetailsViewController = EventDetailsViewController()
            eventDetailsViewController.event = event
            self.navigationController?.pushViewController(eventDetailsViewController, animated: true)
        })
        
        self.view.addSubview(myEventsTag)
        self.view.addSubview(myEventsTableView)
    }
    
    func loadMyEventsList() {
        var newEvents: [CommunityEvent] = []
        var numberOfEventsToLoad = 0
        if (UserSession.user.events_going.count <= UserSession.defaultLoadCountEvents) {
            numberOfEventsToLoad = UserSession.user.events_going.count - 1
        } else {
            numberOfEventsToLoad = UserSession.defaultLoadCountEvents
        }
        if (numberOfEventsToLoad > 0) {
            for index in 0...numberOfEventsToLoad {
                //ActivityHelper.startActivity(view: self.view)
                let getEventRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String(UserSession.user.events_going[index]), methodType: "GET", postContent: nil)
                if (getEventRequest != nil) {
                    APIDelegate.performTask(withRequest: getEventRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newEvents.append(try CommunityEvent(json: json![0])!)
                                self.myEventsTableView.reloadEvents(events: newEvents)
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
