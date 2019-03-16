//
//  Enums.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/14/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

enum SerializationError:Error {
    case missing(String)
    case invalid(String, Any)
}

enum EventDetailType {
    case DATE
    case REPEATING_INFO
    case LOCATION
    case DETAILS
    case ATTENDANCE
}

enum Permission {
    case OWNER
    case ADMIN
    case MEMBER
    case VISITOR
}
