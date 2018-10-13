//
//  User.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

class User {
    var firstName: String!
    var lastName: String!
    var userName: String?
    var password: String?
    var email = ""
    var communities = [Community?]()
    
    init (firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
}
