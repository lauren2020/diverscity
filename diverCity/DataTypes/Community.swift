//
//  Community.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

struct Community {
    var id: String
    var profileImage: UIImage?
    var name: String
    var description: String
    var privacyType: PrivacyType!
    var viewed_by: [String] = []
    var members: [String] = []
    var features: [String] = []
    var location: CLLocation?
    var beacon: CLBeacon?
    var creator: String!
    var owner: String!
    var admins: [String] = []
    var ambassadors: [String] = []
    
    var current_events: [String] = []
    var past_events: [String] = []
    
    var feed: [String] = []
    
    var tags: [Tag] = []
    var category: Tag?
    var address: Address!
    
    var allowMembersToPostToFeed: Bool = false
    var allowMembersToPostEvents: Bool = false
}

extension Community {
    init?(json: [String: Any]) throws {
        print("structing")
        guard let name = json["name"] as? String,
            let id = json["id"] as? Int,
            let description = json["description"] as? String,
            let privacy_type = json["privacy_type"] as? Int,
            let features = json["features"] as? [String],
            let members = json["members"] as? [String],
            let creator = json["creator"] as? String,
            let admins = json["admins"] as? [String],
            let currentEvents = json["current_events"] as? [String],
            let pastEvents = json["past_events"] as? [String],
            let posts = json["feed"] as? [String]
        else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        let location = json["location"] as? String
        let owner = json["owner"] as? String
        
        self.id = String(id)
        self.name = name
        self.features = features.split(separator: ",").map(String.init)
        self.description = description
        self.privacyType = PrivacyType(visibility: privacy_type)
        self.members = members
        self.admins = admins
        self.current_events = currentEvents
        self.past_events = pastEvents
        self.feed = posts
        self.address = Address(line1: "1234 Linden Ave", line2: nil, city: "Scranton", state: "PA", zipcode: "10087")
        //self.location = CLLocation.init(latitude: CGFloat(location?.split(separator: ",").map(String.init)[0]) ?? 0, longitude: CGFloat(location.split(separator: ",").map(String.init)[1]) ?? 0)
        //self.beacon = CLBeacon.init()
        self.creator = creator
        self.owner = owner
    }
}

