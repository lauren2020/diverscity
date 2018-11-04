//
//  Community.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation
import CoreLocation

struct Community {
    var name: String
    var description: String
    var privacyType: PrivacyType!
    var members: [String?] = []
    var location: CLLocation?
    var beacon: CLBeacon?
    var creator: String!
}

extension Community {
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let name = json["name"] as? String,
            let description = json["description"] as? String,
            let privacy_type = json["privacy_type"] as? Int,
            let members = json["members"] as? String
            //let creator = json["creator"] as? String
        else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        
        self.name = name
        self.description = description
        self.privacyType = PrivacyType(visibility: privacy_type)
        for member in members.split(separator: ",") {
            self.members.append(String(member))
        }
        //self.location = CLLocation.init(latitude: 0, longitude: 0)
        //self.beacon = CLBeacon.init()
        self.creator = "1"//creator
    }
    
    static func communityInfo (withId id:String, completion: @escaping (Community?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: id, methodType: "GET")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetCommunity:Community? = nil
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let communityObject = try? Community(json: json) {
                            targetCommunity = communityObject!
                            //targetCommunity.append(communityObject!)
                        }
                    }
                } catch {
                    print("error")
                    print(error)
                }
                
                completion(targetCommunity)
            }
        })
        
        task.resume()
    }
}

