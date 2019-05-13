//
//  CreateNewAccountViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class CreateNewAccountViewModel: BaseViewModel {
    var newUserPostCompleteEvent: ActionEvent = ActionEvent<User>()
    var passwordsDontMatchEvent: ActionEvent = ActionEvent<Void>()
    var emailsDontMatchEvent: ActionEvent = ActionEvent<Void>()
    var passwordNotValidEvent: ActionEvent = ActionEvent<Void>()
    var fieldCannotBeEmptyEvent: ActionEvent = ActionEvent<String>()
    
    func postNewUser(id: String, username: String?, password: String?, passwordConfirm: String?, firstName: String?, lastName: String?, email: String?, emailConfirm: String?, zipcode: String?, privacyType: String?) {
        
        let inputValidity = validateInput(password: password, passwordConfirm: passwordConfirm, email: email, emailConfirm: emailConfirm)
        if (inputValidity) {
            
            let body = buildBody(username: username, password: password, firstName: firstName, lastName: lastName, email: email, zipcode: zipcode, privacyType: privacyType)
            
            startActivityEvent.trigger(data: ())
            let getUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: id, methodType: "POST", postContent: APIDelegate.buildPostString(body: body))
            if (getUserRequest != nil) {
                APIDelegate.performTask(withRequest: getUserRequest!, completion: {json in
                    self.stopActivityEvent.trigger(data: ())
                    if (json != nil && json?.count != 0) {
                        do {
                            print("User created successfully!")
                            UserSession.user = try User(json: json![0])
                            self.newUserPostCompleteEvent.trigger(data: UserSession.user)
                        } catch {
                            print(error)
                            self.stopActivityEvent.trigger(data: ())
                        }
                    }
                })
            }
        }
    }
    
    func validateInput(password: String?, passwordConfirm: String?, email: String?, emailConfirm: String?) -> Bool {
        var allFieldsComplete = true
        
        if(password == "" || password == nil) {
            fieldCannotBeEmptyEvent.trigger(data: "password")
        } else if(password != passwordConfirm) {
            allFieldsComplete = false
            passwordsDontMatchEvent.trigger(data: ())
        } else if (password!.count < 8) {
            passwordNotValidEvent.trigger(data: ())
        }
        
        if(email == "" || email == nil) {
            fieldCannotBeEmptyEvent.trigger(data: "email")
        } else if(email != emailConfirm) {
            allFieldsComplete = false
            emailsDontMatchEvent.trigger(data: ())
        }
        
        return allFieldsComplete
    }
    
    func buildBody(username: String?, password: String?, firstName: String?, lastName: String?, email: String?, zipcode: String?, privacyType: String?) -> [String] {
        var body = ["username=" + (username ?? "")]
        body.append("password=" + (password ?? ""))
        body.append("firstname=" + (firstName ?? ""))
        body.append("lastname=" + (lastName ?? ""))
        body.append("email=" + (email ?? ""))
        body.append("communities=")
        body.append("friends=")
        body.append("zipcode=" + (zipcode ?? ""))
        body.append("privacy_type=" + (privacyType ?? ""))
        
        return body
    }
}

