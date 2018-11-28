//
//  User.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

struct User {
    var id: String
    var firstName: String
    var lastName: String
    var userName: String
    var password: String
    var email: String
    var communityIds: [String] = []
    var communities:[Community] = []
    var events: String
    var state: Int
    var zipcode: Int
    var about_me: String
    var ambassadors: String
    var ambassador_to: String
    var ambassador_communities: String
    var ambassador_requests: String
    var communities_invited: String
    var privacy_type: Int
    var tags: String
}

extension User {
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let firstname = json["firstname"] as? String,
        let lastname = json["lastname"] as? String,
        let id = json["id"] as? Int,
        let username = json["username"] as? String,
        let email = json["email"] as? String,
        let communitiesString = json["communities"] as? String
            else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        let password = json["password"] as? String
        let events = json["events"] as? String
        let state = json["state"] as? Int
        let zipcode = json["zipcode"] as? Int
        let about_me = json["about_me"] as? String
        let ambassadors = json["ambassadors"] as? String
        let ambassador_to = json["ambassador_to"] as? String
        let ambassador_communities = json["ambassador_communities"] as? String
        let ambassador_requests = json["ambassador_requests"] as? String
        let communities_invited = json["communities_invited"] as? String
        let privacy_type = json["privacy_type"] as? Int
        let tags = json["tags"] as? String

        self.id = String(id)
        self.firstName = firstname
        self.lastName = lastname
        self.userName = username
        self.password = password != nil ? password! : ""
        self.email = email
        for communityId in communitiesString.split(separator: ",") {
            self.communityIds.append(String(communityId))
        }
        self.events = events != nil ? events! : ""
        self.state = state != nil ? state! : -1
        self.zipcode = zipcode != nil ? zipcode! : -1
        self.about_me = about_me != nil ? about_me! : ""
        self.ambassadors = ambassadors != nil ? ambassadors! : ""
        self.ambassador_to = ambassador_to != nil ? ambassador_to! : ""
        self.ambassador_communities = ambassador_communities != nil ? ambassador_communities! : ""
        self.ambassador_requests = ambassador_requests != nil ? ambassador_requests! : ""
        self.communities_invited = communities_invited != nil ? communities_invited! : ""
        self.privacy_type = privacy_type != nil ? privacy_type! : -1
        self.tags = tags != nil ? tags! : ""
    }
    
    static func accountInfo (withId id:String, completion: @escaping (User?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: id, methodType: "GET", postContent: nil)
        if(request == nil) {
            completion(nil)
        }
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetUser: User? = nil
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let userObject = try? User(json: json) {
                            targetUser = userObject!
                        }
                    }
                } catch {
                    print("error")
                    print(error)
                }
                DispatchQueue.main.async {
                    completion(targetUser)
                }
            }
        })
        
        task.resume()
    }
    
    static func patch(id: String, body: [String], completion: @escaping (User?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: id, methodType: "PATCH", postContent: APIDelegate.buildPostString(body: body))
        if(request == nil) {
            completion(nil)
        }
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetUser:User? = nil
            print("In Task.")
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print("JSON: ", json)
                        if let userObject = try? User(json: json) {
                            print("UserObject: ", userObject)
                            targetUser = userObject!
                        }
                    }
                } catch {
                    print("error in creation")
                    print(error)
                }
                //print("Target User: ", targetUser)
                DispatchQueue.main.async {
                    completion(targetUser)
                }
            }
        })
        
        task.resume()
    }
    
    static func createNew(body: [String], completion: @escaping (User?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: "1", methodType: "POST", postContent: APIDelegate.buildPostString(body: body))
        if(request == nil) {
            completion(nil)
        }
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetUser:User? = nil
             print("In Task.")
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                         print("JSON: ", json)
                        if let userObject = try? User(json: json) {
                            print("UserObject: ", userObject)
                            targetUser = userObject!
                        }
                    }
                } catch {
                    print("error in creation")
                    print(error)
                }
                //print("Target User: ", targetUser)
                DispatchQueue.main.async {
                    completion(targetUser)
                }
            }
        })
        
        task.resume()
    }
    
    static func all (withId id:String, completion: @escaping ([User]) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: "all", methodType: "GET", postContent: nil)
        let task = URLSession.shared.dataTask(with: request!, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetUsers:[User] = []
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] {
                        for user in json {
                            if let userObject = try? User(json: user) {
                                targetUsers.append(userObject!)
                            }
                        }
                    }
                } catch {
                    print("error")
                    print(error)
                }
                
                DispatchQueue.main.async {
                    completion(targetUsers)
                }
            }
        })
        
        task.resume()
    }
}
