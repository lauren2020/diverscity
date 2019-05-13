//
//  SignInViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class SignInViewModel: BaseViewModel {
    var onSignInComplete: ActionEvent = ActionEvent<User>()
    
    func sendSignInRequest(id: String) {
        startActivityEvent.trigger(data: ())
        let getUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: id, methodType: "GET", postContent: nil)
        if (getUserRequest != nil) {
            APIDelegate.performTask(withRequest: getUserRequest!, completion: {json in
                self.stopActivityEvent.trigger(data: ())
                if (json != nil && json?.count != 0) {
                    do {
                        UserSession.user = try User(json: json![0])
                        self.onSignInComplete.trigger(data: UserSession.user)
                    } catch {
                        print(error)
                    }
                }
            })
        }
    }
}
