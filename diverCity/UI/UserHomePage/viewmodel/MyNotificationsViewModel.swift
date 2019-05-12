//
//  MyNotificationsViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class MyNotificationsListViewModel : BaseViewModel {
    var loadMyNotifiationsEvent: ActionEvent = ActionEvent<([Notification])>()
    
    func loadMyNotificationsList() {
        var newNotifications: [Notification] = []
        var numberOfNotificationsToLoad = 0
        if (UserSession.user.notifications.count <= UserSession.defaultLoadCountEvents) {
            numberOfNotificationsToLoad = UserSession.user.notifications.count - 1
        } else {
            numberOfNotificationsToLoad = UserSession.defaultLoadCountEvents
        }
        if (numberOfNotificationsToLoad > 0) {
            for index in 0...numberOfNotificationsToLoad {
                startActivityEvent.trigger(data: ())
                let getNotificationRequest = APIDelegate.requestBuilder(withPath: APIDelegate.notificationsPath, withId: String(UserSession.user.notifications[index]), methodType: "GET", postContent: nil)
                if (getNotificationRequest != nil) {
                    APIDelegate.performTask(withRequest: getNotificationRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newNotifications.append(try Notification(json: json![0])!)
                                self.loadMyNotifiationsEvent.trigger(data: (newNotifications))
                            } catch {
                                print(error)
                            }
                        }
                    })
                } else {
                    stopActivityEvent.trigger(data: ())
                }
            }
        }
    }
}
