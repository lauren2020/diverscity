//
//  Post.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var id: String
    var title: String
    var body: String
    var media: [String]
    var comments: [String]
    var sharedBy: [String]
    var likedBy: [String]
    var postDate: Date
    var user: String!
    var community: String!
    
    init(id: String, title: String, body: String, media: [String], comments: [String], sharedBy: [String], likedBy: [String], postDate: Date, user: String, community: String) {
        self.id = id
        self.title = title
        self.body = body
        self.media = media
        self.comments = comments
        self.sharedBy = sharedBy
        self.likedBy = likedBy
        self.postDate = postDate
        self.user = user
        self.community = community
    }
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let id = json["id"] as? Int,
            let title = json["title"] as? String, //one
            let body = json["body"] as? String, //one
            let postDate = json["date"] as? Int, //one
            let comments = json["comments"] as? String, //many
            let shared_by = json["shared_by"] as? String, //many
            let liked_by = json["liked_by"] as? String, //many
            let community = json["community"] as? String
            else {
                //print(error)
                throw SerializationError.missing("Value id missing for x")
        }
        let userId = json["user"] as? String
        let media = json["media"] as? String
        
        self.id = String(id)
        self.title = title
        self.body = body
        let timeInterval = TimeInterval(exactly: postDate)
        if (timeInterval != nil) {
            self.postDate = Date(timeIntervalSince1970: timeInterval!)
        } else {
            throw SerializationError.invalid("Time interval invalid", postDate)
        }
        self.comments = comments.split(separator: ",").map(String.init)
        self.sharedBy = shared_by.split(separator: ",").map(String.init)
        self.likedBy = liked_by.split(separator: ",").map(String.init)
        self.media = []
//        //Get Community
        let devStubs = DevStubs()
        self.user = userId//devStubs.getUser()
        self.community = community
//        do {
//            self.community = try Community(json: devStubs.communityJson1)
//        } catch {
//            print(error)
//            throw SerializationError.invalid("Community is not valid!", devStubs.communityJson1)
//        }
//        launchSetCommunity(community: community, setter: setCommunity)
//        //Get User
//        launchSetUser(user: userId, setter: setUser)
//        //Get Media
//        launchSetMedia(media: media, setter: setMedia)
    }
    
    func launchSetCommunity(community: String, setter: @escaping (Community?) -> ()) {
        var newCommunity: Community? = nil
        let getCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: community, methodType: "GET", postContent: nil)
        if (getCommunityRequest != nil) {
            APIDelegate.performTask(withRequest: getCommunityRequest!, completion: {jsons in
                if (jsons != nil && jsons!.count != 0) {
                    do {
                        newCommunity = try Community(json: jsons![0])!
                    } catch {
                        print(error)
                    }
                    setter(newCommunity)
                }
            })
        }
    }
    
    func launchSetUser(user: String?, setter: @escaping (User?) -> ()) {
        var newUser: User? = nil
        if (user != nil) {
            let getUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: user!, methodType: "GET", postContent: nil)
            if (getUserRequest != nil) {
                APIDelegate.performTask(withRequest: getUserRequest!, completion: {jsons in
                    if (jsons != nil && jsons!.count != 0) {
                        do {
                            newUser = try User(json: jsons![0])!
                        } catch {
                            print(error)
                        }
                        setter(newUser)
                    }
                })
            }
        }
    }
    
    func launchSetMedia(media: String?, setter: @escaping ([Media]) -> ()) {
        var newMedia: [Media] = []
        if (media != nil) {
            let getMediaRequest = APIDelegate.requestBuilder(withPath: APIDelegate.mediaPath, withId: media!, methodType: "GET", postContent: nil)
            if (getMediaRequest != nil) {
                APIDelegate.performTask(withRequest: getMediaRequest!, completion: {jsons in
                    if (jsons != nil && jsons!.count != 0) {
                        for media in jsons! {
                            do {
                                newMedia.append(try Media(json: media)!)
                            } catch {
                                print(error)
                            }
                            setter(newMedia)
                        }
                    }
                })
            }
        }
    }
    
//    func setUser(user: User?) {
//        self.user = user
//    }
//    
//    func setCommunity(community: Community?) {
//        if (community != nil) {
//            self.community = community!
//        }
//    }
//    
//    func setMedia(media: [Media]) {
//        self.media = media
//    }
}
