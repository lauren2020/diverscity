//
//  User.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation
import Alamofire

//class User {
//    var firstName: String?
//    var lastName: String?
//    var userName: String?
//    var password: String?
//    var email: String?
//    var communities = [Community?]()
//    var events: String?
//    var address: String?
//    var state: Int?
//    var zipcode: Int?
//    var about_me: String?
//    var ambassadors: String?
//    var ambassador_to: String?
//    var ambassador_communities: String?
//    var ambassador_requests: String?
//    var communities_invited: String?
//    var privacy_type: Int?
//    var tags: String?
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//
//    }
//}

struct User {

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
        let username = json["username"] as? String,
        let password = json["password"] as? String,
        let email = json["email"] as? String,
        let communitiesString = json["communities"] as? String
            else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
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

        self.firstName = firstname
        self.lastName = lastname
        self.userName = username
        self.password = password
        self.email = email
        for communityId in communitiesString.split(separator: ",") {
            self.communityIds.append(String(communityId))
            //Community.communityInfo(withId: String(communityId), completion: addCommunities)
//            var communities: [Community] = []
//            Community.communityInfo(withId: String(communityId)) {
//                (results:[Community]) in
//                for result in results {
//                    communities.append(result)
//                }
//            }
//            self.communities = communities
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
    
//    mutating func addCommunities(communityIn: Community?) {
//        if (communityIn != nil) {
//            self.communities.append(communityIn!)
//        } else {
//            print("Failed to retrieve community!")
//        }
//    }
    
    static func info(withId id:String, function: @escaping (User?)->()) {
        Alamofire.request(APIDelegate.path + APIDelegate.usersPath + id).responseJSON { response in
            //print("Request: \(String(describing: response.request))")   // original url request
            //print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            switch response.result {
            case .success:
                print("Validation Successful")
                if let json = response.result.value {
                    print("JSON: \(json)") // serialized json response
                    if let userObject = try? User(json: json as! [String : Any]) {
                        //targetUser.append(userObject!)
                        function(userObject!)
                    }
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
            case .failure(let error):
                function(nil)
                print(error)
            }
        }
    }
    
    static func accountInfo (withId id:String, completion: @escaping (User?) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: id, methodType: "GET")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
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
                
                completion(targetUser)
            }
        })
        
        task.resume()
    }
    
    static func all (withId id:String, completion: @escaping ([User]) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: "1", methodType: "GET")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetUser:[User] = []
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        //if let users = json[""] as? [[String:Any]] {
                        //print(users)
                        //for user in users {
                        if let userObject = try? User(json: json) {
                            print("Object: ", userObject)
                            targetUser.append(userObject!)
                        }
                        //}
                        //}
                    }
                } catch {
                    print("error")
                    print(error)
                }
                
                completion(targetUser)
            }
        })
        
        task.resume()
    }
}
