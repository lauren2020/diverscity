//
//  Address.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/14/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

struct Address {
    var line1: String!
    var line2: String?
    var city: String!
    var state: String!
    var zipcode: String!
    
    init(line1: String, line2: String?, city: String, state: String, zipcode: String) {
        self.line1 = line1
        self.line2 = line2
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
}

extension Address {
    init(json: [String:Any]) throws {
        guard let id = json["id"] as? String,
            let line1 = json["line1"] as? String,
            let city = json["city"] as? String,
            let state = json["state"] as? String,
            let zipcode = json["zipcode"] as? String
            else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        let line2 = json["line2"] as? String?
        
        self.line1 = line1
        self.line2 = line2 ?? nil
        self.city = city
        self.state = state
        self.zipcode = zipcode
    }
}
