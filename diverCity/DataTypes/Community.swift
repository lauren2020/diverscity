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
    var members: [String] = []
    var features: [String] = []
    var location: CLLocation?
    var beacon: CLBeacon?
    var creator: String!
    var events: [String]
    var feed: [String]
}

extension Community {
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let name = json["name"] as? String,
            let id = json["id"] as? Int,
            let description = json["description"] as? String,
            let privacy_type = json["privacy_type"] as? Int,
            let features = json["features"] as? String,
            let members = json["members"] as? String
            //let creator = json["creator"] as? String
            //let events = json["events"] as? String
            //let posts = json["posts"] as? String
        else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        
        self.id = String(id)
        self.name = name
        self.features = features.split(separator: ",").map(String.init)
        self.description = description
        self.privacyType = PrivacyType(visibility: privacy_type)
        for member in members.split(separator: ",") {
            self.members.append(String(member))
        }
        let devStubs = DevStubs()
        self.events = []
        self.feed = []
        //self.location = CLLocation.init(latitude: 0, longitude: 0)
        //self.beacon = CLBeacon.init()
        self.creator = "1"//creator
    }
}

