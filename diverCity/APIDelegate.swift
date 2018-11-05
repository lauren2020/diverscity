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
    static let currentVersion = "v1"
    static let path = "https://divircity-api.herokuapp.com/api/v1"
    static let usersPath = "/users"
    static let communitiesPath = "/communities"
    static let eventsPath = "/events"
    
    
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
        if (methodType == "GET") {
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
                print("REQUEST: ", request)
            } else {
                print("THERE WAS AN ERROR")
                return nil
            }
            //request.httpBody = postString.data(using: .utf8)
        }
        return request
    }
    
    static func buildPostString(body: [String]) -> String {
        var postString = body != [] ? body[0] : ""
        for index in 1...body.count - 1 {
            postString += "&" + body[index]
        }
        return postString
    }
    
    static func performTask(withRequest request: URLRequest) {
        
    }
}
