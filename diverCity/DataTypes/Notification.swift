//
//  Notification.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class Notification {
    enum NotificationType: Int {
        case EVENT_REMINDER = 0
        case GTYK_REQUEST = 1
        case CONNECTION_REQUEST = 2
        case GENERAL = 3
    }
    
    var id: Int = 0
    var type: Int = NotificationType.GENERAL.rawValue
    var alert: String = ""
    var image: UIImage = UIImage()
    var read: Bool = false
    
    init(id: Int, type: Int, alert: String) {
        self.id = id
        self.type = type
        self.alert = alert
    }
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        print("structing")
        guard let id = json["id"] as? Int,
            let type = json["type"] as? Int, //one
            let alert = json["alert"] as? String,
            let read = json["read"] as? Bool
            else {
                throw SerializationError.missing("Value id missing for x")
        }
        
        self.id = id
        self.type = type
        self.alert = alert
        self.read = read
    }
}

//extension Notification {
//    enum SerializationError:Error {
//        case missing(String)
//        case invalid(String, Any)
//    }
//    init?(json: [String: Any]) throws {
//        print("structing")
//        guard let id = json["id"] as? Int,
//            let type = json["type"] as? Int, //one
//            let alert = json["alert"] as? String,
//            let read = json["read"] as? Bool
//            else {
//                throw SerializationError.missing("Value id missing for x")
//        }
//
//        self.id = id
//        self.type = type
//        self.alert = alert
//        self.read = read
//    }
//}
