//
//  CommunityEvent.swift
//  diverCity
//
//  Created by Lauren Shultz on 11/3/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

struct CommunityEvent {
    var name: String!
    var recuring: Bool!
    var date: Date?
    var startTime: Double?
    var endTime: Double?
    var privacyType: PrivacyType
    
    var going: [String] = []
    var interested: [String] = []
    var notGoing: [String] = []
    var invited: [String] = []
    
    var description: String?
    var category: Tag!
    var coverImage: UIImage?
    var creator: String!
    var community: String!
    var tags: [Tag] = []
    var address: Address?
    var locationName: String!
}

extension CommunityEvent {
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let name = json["name"] as? String,
            let recuring = json["recurring"] as? Bool,
            let date = json["date"] as? Int,
            let startTime = json["start_time"] as? Double,
            let endTime = json["end_time"] as? Double,
            let going = json["going"] as? String?,
            let interested = json["interested"] as? String?,
            let notGoing = json["not_going"] as? String?,
            let category = json["category"] as? String?,
            let creator = json["creator"] as? String?,
            let locationName = json["location_name"] as? String?,
            let address = json["address"] as? String?,
            let privacyType = json["privacy_type"] as? String?,
            let community = json["community"] as? String?
            else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        let imageData = json["image"] as? String
        
        self.name = name
        self.recuring = recuring
        self.date = Date()
        self.startTime = startTime
        self.endTime = endTime
        self.going = going != nil ? going!.components(separatedBy: ",") : []
        self.notGoing = notGoing != nil ? notGoing!.components(separatedBy: ",") : []
        self.interested = interested != nil ? interested!.components(separatedBy: ",") : []
        self.category = Tag(id: 0, label: category ?? "PARTY", colorCode: 0)
        self.address = Address(line1: "1234 Linden Ave", line2: nil, city: "Scranton", state: "PA", zipcode: "10087")
        self.locationName = "Central Perk"
        self.creator = creator
        self.community = community
        self.locationName = locationName
        self.privacyType = PrivacyType(visibility: 0)
        
        if (imageData != nil) {
            let data = Data(base64Encoded: imageData!)
            if (data != nil) {
                self.coverImage = UIImage(data: data!)
            } else {
                //could not load image
                self.coverImage = UIImage(named: "omaha1")
            }
        } else {
            //has no image
            self.coverImage = UIImage(named: "omaha1")
        }
        
        let devStub = DevStubs()
    }
}
