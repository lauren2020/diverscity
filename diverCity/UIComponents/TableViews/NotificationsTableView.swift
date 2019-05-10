//
//  NotificationsTableView.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class NotificationsTableView: UITableView {
    var itemsList: [Notification]
    var onNotificationSelected: (_ notification: Notification) -> () = {_ in }
    
    init(frame: CGRect, notificationsList: [Notification], notificationSelectedCallback: @escaping (_ notification: Notification) -> ()) {
        let style: UITableViewStyle = UITableViewStyle.plain
        onNotificationSelected = notificationSelectedCallback
        self.itemsList = notificationsList
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(UserTableCell.self, forCellReuseIdentifier: "notificationCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadNotifications(notifications: [Notification]) {
        self.itemsList = notifications
        self.reloadData()
    }
}

extension NotificationsTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationTableCell
        cell.notificationItemView.loadPost(notification: itemsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onNotificationSelected(itemsList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
