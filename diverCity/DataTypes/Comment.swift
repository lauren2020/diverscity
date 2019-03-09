//
//  Comment.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class Comment {
    var body: String
    var user: User
    var date: Date
    
    init(body: String, user: User, date: Date) {
        self.body = body
        self.user = user
        self.date = date
    }
}
