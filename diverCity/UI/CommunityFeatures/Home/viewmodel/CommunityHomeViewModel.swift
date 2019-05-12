//
//  CommunityHomeViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class CommunityHomeViewModel : BaseViewModel {
    let addUserToCommunityEvent: ActionEvent = ActionEvent<Community?>()
    let patchCommunityCompletedEvent: ActionEvent = ActionEvent<Void>()
    
    func addUserToCommunity() {
        let newMembers = (UserSession.selectedCommunity?.members.joined(separator: ","))! == "" ? (UserSession.user?.id)! : (UserSession.selectedCommunity?.members.joined(separator: ","))! + "," + (UserSession.user?.id)!
        startActivityEvent.trigger(data: ())
        let content = APIDelegate.buildPostString(body: ["members=" + newMembers])
        let patchCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: (UserSession.selectedCommunity?.id)!, methodType: "PATCH", postContent: content)
        if (patchCommunityRequest != nil) {
            APIDelegate.performTask(withRequest: patchCommunityRequest!, completion: {json in
                if (json != nil && json?.count != 0) {
                    do {
                        self.addUserToCommunityEvent.trigger(data: try Community(json: json![0]))
                        self.stopActivityEvent.trigger(data: ())
                    } catch {
                        self.stopActivityEvent.trigger(data: ())
                        print(error)
                    }
                }
            })
        }
    }
    
    func patchCommunityCompletion(community: Community?) {
        if(community != nil) {
            UserSession.selectedCommunity = community
            let community = UserSession.selectedCommunity
            let newCommunities = (UserSession.user?.communities.joined(separator: ","))! == "" ? (community?.id) : (UserSession.user?.communities.joined(separator: ","))! + "," + (community?.id)!
            let content = APIDelegate.buildPostString(body: ["communities=" + newCommunities!])
            let patchUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: (UserSession.user?.id)!, methodType: "PATCH", postContent: content)
            if (patchUserRequest != nil) {
                APIDelegate.performTask(withRequest: patchUserRequest!, completion: {json in
                    self.stopActivityEvent.trigger(data: ())
                    if (json != nil && json?.count != 0) {
                        do {
                            UserSession.user = try User(json: json![0])
                            print("Community added to user!")
                            self.patchCommunityCompletedEvent.trigger(data: ())
                        } catch {
                            print(error)
                        }
                    } else {
                        self.stopActivityEvent.trigger(data: ())
                    }
                })
            } else {
                stopActivityEvent.trigger(data: ())
            }
            print("User Added to Community!")
        } else {
            stopActivityEvent.trigger(data: ())
            print("Unable to add member to community!")
        }
    }
}
