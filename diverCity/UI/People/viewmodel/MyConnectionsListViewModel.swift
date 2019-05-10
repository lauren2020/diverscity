//
//  MyConnectionsListViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class MyConnectionsListViewModel {
    var loadConnectionsEvent = ActionEvent<([User])>()
    var startActivityEvent = ActionEvent<()>()
    var stopActivityEvent = ActionEvent<()>()
    
    func loadMyConnections() {
        var newConnections: [User] = []
        var numberOfConnectionsToLoad = 0
        if (UserSession.user.events_going.count <= UserSession.defaultLoadCountEvents) {
            numberOfConnectionsToLoad = UserSession.user.events_going.count - 1
        } else {
            numberOfConnectionsToLoad = UserSession.defaultLoadCountEvents
        }
        if (numberOfConnectionsToLoad > 0) {
            for index in 0...numberOfConnectionsToLoad {
                startActivityEvent.trigger(data: ())
                let getEventRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String(UserSession.user.events_going[index]), methodType: "GET", postContent: nil)
                if (getEventRequest != nil) {
                    APIDelegate.performTask(withRequest: getEventRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newConnections.append(try User(json: json![0])!)
                                loadConnectionsEvent.trigger(data: ([newConnections]))
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
