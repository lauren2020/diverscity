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
    static func requestBuilder(withPath localPath: String, withId id: String, methodType:String) -> URLRequest {
        let url = URL(string: path + localPath + "/" + id)
        var request = URLRequest(url: url!)
        if(methodType == "POST") {
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = methodType
            let postString = "id=13&name=Jack"
            request.httpBody = postString.data(using: .utf8)
        }
        return request
    }
    
    static func performTask(withRequest request: URLRequest) {
        
    }
}
