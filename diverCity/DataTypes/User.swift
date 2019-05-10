//
//  User.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

struct User {
    var id: String
    var profileImage: UIImage?
    var coverPhoto: UIImage?
    var firstName: String
    var lastName: String
    var userName: String
    var email: String
    var phone_number: String
    var address_line1: String?
    var address_line2: String?
    var city: String
    var state: Int
    var zip: Int?
    var about_me: String
    
    var notifications: [String] = []
    
    var communities: [String] = []
    // notification
    var communities_invited: [String] = []
    
    var events_going: [String] = []
    var events_interested: [String] = []
    var events_not_going: [String] = []
    
    var ambassadors: [String] = []
    var ambassadors_pending: [String] = []
    var ambassador_to: [String] = []
    var ambassador_communities: [String] = []
    var ambassador_communities_disabled: [String] = []
    var ambassador_requests: [String] = []
    
    var connections: [String] = []
    
    var privacy_type: Int
    var tags: [Tag] = []
}

extension User {
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let firstname = json["first_name"] as? String,
        let lastname = json["last_name"] as? String,
        let id = json["id"] as? Int,
        let username = json["username"] as? String,
        let email = json["email"] as? String,
        let communities = json["communities"] as? [String]
            else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        let events = json["events"] as? String
        let state = json["state"] as? Int
        let zipcode = json["zipcode"] as? Int
        let about_me = json["about_me"] as? String
        let ambassadors = json["ambassadors"] as? [String]
        let ambassador_to = json["ambassador_to"] as? [String]
        let ambassador_communities = json["ambassador_communities"] as? [String]
        let ambassador_requests = json["ambassador_requests"] as? [String]
        let communities_invited = json["communities_invited"] as? [String]
        let privacy_type = json["privacy_type"] as? Int
        let tags = json["tags"] as? [String]

        self.id = String(id)
        self.firstName = firstname
        self.lastName = lastname
        self.userName = username
        self.email = email
        self.phone_number = ""
        self.communities = ["1"]//communities
        
        self.events_going = []//["1", "2", "3"]//[events != nil ? events! : ""]
        self.events_interested = []//["4", "5"]
        
        self.state = state != nil ? state! : -1
        self.city = ""
        self.zip = zipcode != nil ? zipcode! : -1
        self.about_me = about_me != nil ? about_me! : ""
        self.ambassadors = ambassadors ?? []
        self.ambassador_to = ambassador_to ?? []
        self.ambassador_communities = ambassador_communities ?? []
        self.ambassador_requests = ambassador_requests ?? []
        self.communities_invited = communities_invited ?? []
        self.privacy_type = privacy_type != nil ? privacy_type! : -1
        self.tags = [Tag(id: 0, label: "Paper", colorCode: 3), Tag(id: 1, label: "Business", colorCode: 6)]
    }
}
