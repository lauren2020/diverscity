//
//  Community.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation
import CoreLocation

class Community {
    var name: String!
    var privacyType: PrivacyType!
    var members = [User?]()
    var location: CLLocation?
    var beacon: CLBeacon?
    var creator: User!
    
    init (name: String, privacyType: PrivacyType, creator: User) {
        self.name = name
        self.privacyType = privacyType
        self.creator = creator
        self.members = [creator]
    }
}
