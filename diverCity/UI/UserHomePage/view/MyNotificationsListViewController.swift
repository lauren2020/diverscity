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
    var viewModel = MyNotificationsListViewModel()
    var activityHelper = ActivityHelper()
    var myNotificationsHeader: ObjectLabelTag!
    var myNotificationsTableView: NotificationsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Notifications"
        self.view.backgroundColor = UIColor.white
        setupViews()
        setupViewModel()
        viewModel.loadMyNotificationsList()
    }
    
    func setupViews() {
        myNotificationsHeader = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 40), withLabel: "My Notifications")
        myNotificationsTableView = NotificationsTableView(frame: CGRect(x: self.view.frame.minX, y: myNotificationsHeader.frame.maxY, width: self.view.frame.width, height: 550), notificationsList: [], notificationSelectedCallback: { (notification) in
            // TODO: Execute notification action
        })
        
        self.view.addSubview(myNotificationsHeader)
        self.view.addSubview(myNotificationsTableView)
    }
    
    func setupViewModel() {
        viewModel.loadMyNotifiationsEvent.addSubscriber(subscriber: onUpdateNotifications)
        viewModel.startActivityEvent.addSubscriber {
            self.activityHelper.startActivity(view: self.view)
        }
        viewModel.stopActivityEvent.addSubscriber {
            self.activityHelper.stopActivity(view: self.view)
        }
    }
    
    func onUpdateNotifications(newNotifications: [Notification]) {
        self.myNotificationsTableView.reloadNotifications(notifications: newNotifications)
    }
}
