//
//  DevStubs.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class DevStubs {
    var eventJson1: [String:Any] = [:]
    var eventJson2: [String:Any] = [:]
    var eventJson3: [String:Any] = [:]
    
    var userJson1: [String:Any] = [:]
    
    var communityJson1: [String:Any] = [:]
    
    var postJson1: [String:Any] = [:]
    var postJson2: [String:Any] = [:]
    var postJson3: [String:Any] = [:]
    
    var testListOfPosts: [Post] = []
    var testListOfEvents: [CommunityEvent] = []
    var testListOfCommunities: [Community] = []
    
    /////////////////////////// Development Use ONly
    /////EVENTS/////////
    init() {
        eventJson1.updateValue("Paper Pancake Feed", forKey: "name")
        eventJson1.updateValue(false, forKey: "recurring")
        eventJson1.updateValue(1143025200, forKey: "date")
        eventJson1.updateValue(13.5, forKey: "start_time")
        eventJson1.updateValue(14.5, forKey: "end_time")
        eventJson1.updateValue("3", forKey: "going")
        eventJson1.updateValue("2", forKey: "interestd")
        eventJson1.updateValue("8,5", forKey: "not_going")
        eventJson1.updateValue("FOOD", forKey: "category")
        
        eventJson2.updateValue("Michael Scott's Dunder Mifflin Scranton Meredith Palmer Memorial Celebrity Rabies Awareness Pro-Am Fun Run Race For The Cure", forKey: "name")
        eventJson2.updateValue(false, forKey: "recurring")
        eventJson2.updateValue(1143025200, forKey: "date")
        eventJson2.updateValue(9.5, forKey: "start_time")
        eventJson2.updateValue(11.5, forKey: "end_time")
        eventJson2.updateValue("2", forKey: "going")
        eventJson2.updateValue("3,8", forKey: "interestd")
        eventJson2.updateValue("7", forKey: "not_going")
        eventJson1.updateValue("FUNDRAISER", forKey: "category")
        
        eventJson3.updateValue("Good-Bye Toby", forKey: "name")
        eventJson3.updateValue(false, forKey: "recurring")
        eventJson3.updateValue(1143025200, forKey: "date")
        eventJson3.updateValue(13.5, forKey: "start_time")
        eventJson3.updateValue(14.5, forKey: "end_time")
        eventJson3.updateValue("10", forKey: "going")
        eventJson3.updateValue("2", forKey: "interestd")
        eventJson3.updateValue("3,9,5", forKey: "not_going")
        eventJson1.updateValue("PARTY", forKey: "category")
        
        ////////////////USERS////////////////////////////
        userJson1.updateValue(3, forKey: "id")
        userJson1.updateValue("assistantToTheRegionalManager", forKey: "username")
        userJson1.updateValue("bears", forKey: "password")
        userJson1.updateValue("Dwight", forKey: "firstname")
        userJson1.updateValue("Schrute", forKey: "lastname")
        userJson1.updateValue("dschrute@dundermifflin.com", forKey: "email")
        userJson1.updateValue("123 Scranton Ave", forKey: "address")
        userJson1.updateValue(4, forKey: "state")
        userJson1.updateValue(68007, forKey: "zipcode")
        userJson1.updateValue("8,6,5", forKey: "communities")
        userJson1.updateValue("", forKey: "friends")
        userJson1.updateValue("", forKey: "ambassadors")
        userJson1.updateValue("", forKey: "ambassador_to")
        userJson1.updateValue("", forKey: "ambassador_communities")
        userJson1.updateValue("", forKey: "ambassador_requests")
        userJson1.updateValue("", forKey: "myevents")
        userJson1.updateValue("", forKey: "communities_invited")
        userJson1.updateValue("", forKey: "tags")
        userJson1.updateValue("", forKey: "about_me")
        userJson1.updateValue(0, forKey: "privacy_type")
        
        ////////////////////COMMUNITTIES///////////////
        communityJson1.updateValue(10, forKey: "id")
        communityJson1.updateValue("Scranton Improv", forKey: "name")
        communityJson1.updateValue("I have a gun.", forKey: "description")
        communityJson1.updateValue(0, forKey: "privacy_type")
        communityJson1.updateValue("15,2", forKey: "members")
        communityJson1.updateValue("", forKey: "events")
        communityJson1.updateValue("", forKey: "requests_to_join")
        communityJson1.updateValue("", forKey: "location_center")
        communityJson1.updateValue("", forKey: "radius")
        communityJson1.updateValue("", forKey: "icon")
        communityJson1.updateValue("", forKey: "images")
        communityJson1.updateValue("1,3,4", forKey: "features")
        
        //////////////////POSTS///////////////////////
        postJson1.updateValue(2, forKey: "id")
        postJson1.updateValue("Sabre Printers Catch Fire!", forKey: "title")
        postJson1.updateValue("Duncder mifflin salesman Andy Bernard recently captured video evidence of a defect in sabre printers that allows them to catch fire under certain circumstances.", forKey: "body")
        postJson1.updateValue("3", forKey: "media")
        postJson1.updateValue("2,5", forKey: "comments")
        postJson1.updateValue("7", forKey: "shared_by")
        postJson1.updateValue("8", forKey: "liked_by")
        postJson1.updateValue(1143025200, forKey: "date")
        postJson1.updateValue("7", forKey: "user")
        postJson1.updateValue("10", forKey: "community")
    
        postJson2.updateValue(1, forKey: "id")
        postJson2.updateValue("Jo bennet buys Dunder Mifflin", forKey: "title")
        postJson2.updateValue("Duncder mifflin salesman Andy Bernard recently captured video evidence of a defect in sabre printers that allows them to catch fire under certain circumstances.", forKey: "body")
        postJson2.updateValue("3", forKey: "media")
        postJson2.updateValue("2,5", forKey: "comments")
        postJson2.updateValue("7", forKey: "shared_by")
        postJson2.updateValue("8", forKey: "liked_by")
        postJson2.updateValue(1143025200, forKey: "date")
        postJson2.updateValue("7", forKey: "user")
        postJson2.updateValue("10", forKey: "community")
        
        postJson3.updateValue(3, forKey: "id")
        postJson3.updateValue("Come join our fun run for rabies!", forKey: "title")
        postJson3.updateValue("Duncder mifflin salesman Andy Bernard recently captured video evidence of a defect in sabre printers that allows them to catch fire under certain circumstances.", forKey: "body")
        postJson3.updateValue("3", forKey: "media")
        postJson3.updateValue("2,5", forKey: "comments")
        postJson3.updateValue("7", forKey: "shared_by")
        postJson3.updateValue("8", forKey: "liked_by")
        postJson3.updateValue(1143025200, forKey: "date")
        postJson3.updateValue("7", forKey: "user")
        postJson3.updateValue("10", forKey: "community")
    }
    
    func getPost() -> Post? {
        do {
            return try Post(json: postJson1)
        } catch {
            print(error)
        }
        return nil
    }
    
    func getPostList() -> [Post] {
        do {
            let post = try Post(json: postJson1)
            let post2 = try Post(json: postJson2)
            let post3 = try Post(json: postJson3)
            if (post != nil) {
                testListOfPosts.append(post!)
            }
            if (post2 != nil) {
                testListOfPosts.append(post2!)
            }
            if (post3 != nil) {
                testListOfPosts.append(post3!)
            }
        } catch {
            print(error)
        }
        return testListOfPosts
    }
    
    func getEvent() -> CommunityEvent? {
        do {
            return try CommunityEvent(json: eventJson1)
        } catch {
            print(error)
        }
        return nil
    }
    
    func getEventList() -> [CommunityEvent] {
        do {
            let event = try CommunityEvent(json: eventJson1)
            let event2 = try CommunityEvent(json: eventJson2)
            let event3 = try CommunityEvent(json: eventJson3)
            if (event != nil) {
                testListOfEvents.append(event!)
            }
            if (event2 != nil) {
                testListOfEvents.append(event2!)
            }
            if (event3 != nil) {
                testListOfEvents.append(event3!)
            }
        } catch {
            print(error)
        }
        return testListOfEvents
    }
    
    func getCommunity() -> Community? {
        do {
            return try Community(json: communityJson1)
        } catch {
            print(error)
        }
        return nil
    }
    
    func getUser() -> User? {
        do {
            return try User(json: userJson1)
        } catch {
            print(error)
        }
        return nil
    }
}
