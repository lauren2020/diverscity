//
//  MyHomePageViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class MyHomePageViewModel : BaseViewModel {
    var loadMyNotifiationsEvent: ActionEvent = ActionEvent<([Notification])>()
    let loadCommunitiesEvent: ActionEvent = ActionEvent<([Community])>()
    
    func loadCommunities() {
        var newCommunities: [Community] = []
        var numberOfCommunitiesToLoad = 0
        if ((UserSession.user?.communities)!.count <= UserSession.defaultLoadCountCommunities) {
            numberOfCommunitiesToLoad = (UserSession.user?.communities)!.count
        } else {
            numberOfCommunitiesToLoad = UserSession.defaultLoadCountCommunities
        }
        if (numberOfCommunitiesToLoad > 0) {
            for index in 0...numberOfCommunitiesToLoad - 1 {
                startActivityEvent.trigger(data: ())
                let getCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String((UserSession.user?.communities)![index]), methodType: "GET", postContent: nil)
                if (getCommunityRequest != nil) {
                    APIDelegate.performTask(withRequest: getCommunityRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newCommunities.append(try Community(json: json![0])!)
                                print("Setting community");
                                self.loadCommunitiesEvent.trigger(data: newCommunities)
                                self.stopActivityEvent.trigger(data: ())
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
