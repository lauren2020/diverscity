//
//  MyNotificationsViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class MyNotificationsListViewModel {
    var loadMyNotifiationsEvent: ActionEvent = ActionEvent<([Notification])>()
    var startActivityEvent: ActionEvent = ActionEvent<()>()
    var stopActivityEvent: ActionEvent = ActionEvent<()>()
    
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
                startActivityEvent.trigger(data: ())
                let getEventRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String(UserSession.user.events_going[index]), methodType: "GET", postContent: nil)
                if (getEventRequest != nil) {
                    APIDelegate.performTask(withRequest: getEventRequest!, completion: {json in
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
