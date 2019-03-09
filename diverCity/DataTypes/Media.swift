//
//  Media.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class Media {
    var id: String
    var image: UIImage
    var date: Date
    var title: String
    var user: String
    var comments: [String]
    
    init(id: String, image: UIImage, date: Date, title: String, user: String, comments: [String]) {
        self.id = id
        self.image = image
        self.date = date
        self.title = title
        self.user = user
        self.comments = comments
    }
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    init?(json: [String: Any]) throws {
        guard let id = json["id"] as? Int,
            let date = json["date"] as? Double,
            let title = json["title"] as? String,
            let user = json["user"] as? String,
            let data = json["image"] as? Data,
            let comments = json["comments"] as? String
            else {
                print("error")
                throw SerializationError.missing("Value id missing for x")
        }
        //Set Values
        self.id = String(id)
        self.image = UIImage(data: data) ?? UIImage()
        let timeInterval = TimeInterval(exactly: date)
        if (timeInterval != nil) {
            self.date = Date(timeIntervalSince1970: timeInterval!)
        } else {
            throw SerializationError.invalid("Time interval invalid", date)
        }
        self.title = title
        self.user = user
        self.comments = comments.split(separator: ",").map(String.init)
    }
}
