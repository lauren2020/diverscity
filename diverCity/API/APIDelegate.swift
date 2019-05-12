//
//  APIDelegate.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/31/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

struct APIDelegate {
    static let basePath = "https://divircity-api.herokuapp.com/api/"
    static let currentVersion = "v2"
    static let path = "https://divircity-api.herokuapp.com/api/v2"
    static let usersPath = "/users"
    static let communitiesPath = "/communities"
    static let eventsPath = "/events"
    static let notificationsPath = "/notifications"
    static let mediaPath = "/media"
    static let postsPath = "/posts"
    
    
//    func basePath(withVersion version: String) -> String {
//        return path + version
//    }
//    
//    func usersPath(withId id: String) -> String {
//        return path + users + "/" + id
//    }
//    
//    func communitiesPath(withId id: String) -> String {
//        return path + communities + "/" + id
//    }
//    
//    func eventsPath(withId id: String) -> String {
//        return path + events + "/" + id
//    }
}

extension APIDelegate {
    static func requestBuilder(withPath localPath: String, withId id: String, methodType:String, postContent:String?) -> URLRequest? {
        print("Building Request...")
        var urlString = path + localPath
        if ((methodType == "GET" || methodType == "PATCH" || methodType == "DELETE") && id != "all") {
            urlString += "/" + id
        }
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        
        if(methodType == "POST") {
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = methodType
            if (postContent != nil) {
                let postString = postContent!// "id=13&name=Jack"
                request.httpBody = postString.data(using: .utf8)
                //print("REQUEST: ", request)
            } else {
                print("THERE WAS AN ERROR")
                return nil
            }
            //request.httpBody = postString.data(using: .utf8)
        } else if (methodType == "PATCH") {
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = methodType
            if (postContent != nil) {
                let postString = postContent!// "id=13&name=Jack"
                request.httpBody = postString.data(using: .utf8)
                //print("REQUEST: ", request)
            } else {
                print("THERE WAS AN ERROR")
                return nil
            }
        } else if (methodType == "DELETE") {
            request.httpMethod = methodType
        }
        print("REQUEST: ", request)
        return request
    }
    
    static func buildPostString(body: [String]) -> String {
        var postString = body.count != 0 ? body[0] : ""
        if (body.count > 1) {
            for index in 1...body.count - 1 {
                postString += "&" + body[index]
            }
        }
        return postString
    }
    
    static func performTask(withRequest request: URLRequest, completion: @escaping ([[String:Any]]?) -> ()) {
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var returnedJson: [[String:Any]]? = nil
            if let data = data {
                do {
                    print("data: ", data)
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print("JSON: ", json)
                        returnedJson = [json]
                    } else if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] {
                        returnedJson = json
                    }
                } catch {
                    print("error getting info")
                    print(error)
                }
                DispatchQueue.main.async {
                    completion(returnedJson)
                }
            }
        })
        
        task.resume()
    }
    
    static func addNewElemnentToValue(value: String, element: String) -> String {
        if (value == "") {
            return element
        } else {
            return value + "," + element
        }
    }
}
