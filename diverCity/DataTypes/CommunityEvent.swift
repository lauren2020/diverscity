//
//  CommunityEvent.swift
//  diverCity
//
//  Created by Lauren Shultz on 11/3/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

struct CommunityEvent {
    var name: String!
    var recuring: Bool?
    var date: Date?
    var startTime: Double?
    var endTime: Double?
    var going: [String] = []
    var interested: [String] = []
    var notGoing: [String] = []
}

extension CommunityEvent {
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let name = json["name"] as? String,
            let recuring = json["recurring"] as? Bool,
            let date = json["date"] as? Int,
            let startTime = json["start_time"] as? Double,
            let endTime = json["end_time"] as? Double,
            let going = json["going"] as? String?,
            let interested = json["interested"] as? String?,
            let notGoing = json["not_going"] as? String?
            else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        
        self.name = name
        self.recuring = recuring
        self.date = Date()
        self.startTime = startTime
        self.endTime = endTime
        self.going = going != nil ? going!.components(separatedBy: ",") : []
        self.notGoing = notGoing != nil ? notGoing!.components(separatedBy: ",") : []
        self.interested = interested != nil ? interested!.components(separatedBy: ",") : []
    }
    
    static func eventInfo (withId id:String, completion: @escaping ([CommunityEvent]) -> ()) {
        let request = APIDelegate.requestBuilder(withPath: APIDelegate.eventsPath, withId: id, methodType: "GET")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
            var targetEvent:[CommunityEvent] = []
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let eventObject = try? CommunityEvent(json: json) {
                            targetEvent.append(eventObject!)
                        }
                    }
                } catch {
                    print("error")
                    print(error)
                }
                
                completion(targetEvent)
            }
        })
        
        task.resume()
    }
}
