//
//  API.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

class API {
    var users = [User?]()
    
    init () {
        
    }
    
    func getUserAccountInformation(username: String, password: String) -> User {
        for user in users {
            if(user?.userName == username && user?.password == password) {
                return user!
            }
        }
        return User(firstName: "Test", lastName: "User")
    }
    
    func createNewUser(username: String, password: String, firstName: String, lastName: String, email: String) {
        var newUser = User(firstName: firstName, lastName: lastName)
        newUser.userName = username
        newUser.password = password
        newUser.email = email
        users.append(newUser)
    }
}
