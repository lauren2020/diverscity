//
//  MyConnectionsListViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class MyConnectionsListViewModel : BaseViewModel {
    var loadConnectionsEvent = ActionEvent<([User])>()
    
    func loadMyConnections() {
        var newConnections: [User] = []
        var numberOfConnectionsToLoad = 0
        if (UserSession.user.connections.count <= UserSession.defaultLoadCountEvents) {
            numberOfConnectionsToLoad = UserSession.user.events_going.count - 1
        } else {
            numberOfConnectionsToLoad = UserSession.defaultLoadCountEvents
        }
        if (numberOfConnectionsToLoad > 0) {
            for index in 0...numberOfConnectionsToLoad {
                startActivityEvent.trigger(data: ())
                let getConnectionRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: String(UserSession.user.connections[index]), methodType: "GET", postContent: nil)
                if (getConnectionRequest != nil) {
                    APIDelegate.performTask(withRequest: getConnectionRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newConnections.append(try User(json: json![0])!)
                                self.loadConnectionsEvent.trigger(data: newConnections)
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
