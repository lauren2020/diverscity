//
//  MyEventsListViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class MyEventsListViewModel {
    var loadEventsEvent = ActionEvent<[CommunityEvent]>()
    var startActivityEvent = ActionEvent<()>()
    var stopActivityEvent = ActionEvent<()>()
    
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
                startActivityEvent.trigger(data: ())
                let getEventRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String(UserSession.user.events_going[index]), methodType: "GET", postContent: nil)
                if (getEventRequest != nil) {
                    APIDelegate.performTask(withRequest: getEventRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newEvents.append(try CommunityEvent(json: json![0])!)
                                self.loadEventsEvent.trigger(data: (newEvents))
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
