//
//  Event.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

class Event {
    var name: String!
    var recuring: Bool?
    var date: Date?
    var starTime: Double?
    var endTime: Double?
    
    init (name: String) {
        self.name = name
    }
}
