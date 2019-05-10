//
//  MyHomePageViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class MyHomePageViewModel {
    let loadCommunitiesEvent: ActionEvent = ActionEvent<([Community])>()
    let activityStartEvent: ActionEvent = ActionEvent<(Void)>()
    let activityEndEvent: ActionEvent = ActionEvent<(Void)>()
    
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
                activityStartEvent.trigger(data: ())
                let getCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String((UserSession.user?.communities)![index]), methodType: "GET", postContent: nil)
                if (getCommunityRequest != nil) {
                    APIDelegate.performTask(withRequest: getCommunityRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newCommunities.append(try Community(json: json![0])!)
                                print("Setting community");
                                self.loadCommunitiesEvent.trigger(data: newCommunities)
                            } catch {
                                print(error)
                            }
                        }
                    })
                } else {
                    activityEndEvent.trigger(data: ())
                }
            }
        }
    }
}
