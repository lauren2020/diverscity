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
    var id: String
    var name: String
    var description: String
    var privacyType: PrivacyType!
    var members: [String] = []
    var features: [String] = []
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
            let id = json["id"] as? Int,
            let description = json["description"] as? String,
            let privacy_type = json["privacy_type"] as? Int,
            let features = json["features"] as? String,
            let members = json["members"] as? String
            //let creator = json["creator"] as? String
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
        //self.location = CLLocation.init(latitude: 0, longitude: 0)
        //self.beacon = CLBeacon.init()
        self.creator = "1"//creator
    }
    
    static func communityInfo (withId id:String, completion: @escaping (Community?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: id, methodType: "GET", postContent: nil)
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
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
    
    static func patch(id: String, body: [String], completion: @escaping (Community?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: id, methodType: "PATCH", postContent: APIDelegate.buildPostString(body: body))
        if(request == nil) {
            completion(nil)
        }
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetCommunity:Community? = nil
            print("In Task.")
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let communityObject = try? Community(json: json) {
                            print("CommunityObject: ", communityObject)
                            targetCommunity = communityObject!
                        }
                    }
                } catch {
                    print("error in creation")
                    print(error)
                }
                DispatchQueue.main.async {
                    completion(targetCommunity)
                }
            }
        })
        
        task.resume()
    }
    
    static func createNew(body: [String], completion: @escaping (Community?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: "1", methodType: "POST", postContent: APIDelegate.buildPostString(body: body))
        if(request == nil) {
            completion(nil)
        }
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetCommunity:Community? = nil
            print("In Task.")
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let communityObject = try? Community(json: json) {
                            print("CommunityObject: ", communityObject)
                            targetCommunity = communityObject!
                        }
                    }
                } catch {
                    print("error in creation")
                    print(error)
                }
                DispatchQueue.main.async {
                    completion(targetCommunity)
                }
            }
        })
        
        task.resume()
    }
    
    static func all (completion: @escaping ([Community]) -> ()) {
        //print("Enters Get All Function")
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: "all", methodType: "GET", postContent: nil)
        //print("REQUEST: ", request)
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetCommunities: [Community] = []
            if let data = data {
                do {
                    //print("DATA: ", data)
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] {
                        //print("JSON: ", json)
                            for community in json {
                                if let communityObject = try? Community(json: community) {
                                    targetCommunities.append(communityObject!)
                                }
                            }
                    }
                } catch {
                    print("error")
                    print(error)
                }
                DispatchQueue.main.async {
                    completion(targetCommunities)
                }
            }
        })
        
        task.resume()
    }
}

