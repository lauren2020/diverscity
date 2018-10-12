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
}
