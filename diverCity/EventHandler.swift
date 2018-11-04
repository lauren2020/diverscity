//
//  EventHandler.swift
//  diverCity
//
//  Created by Lauren Shultz on 11/2/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit
/**
 Since funcs can not be tested for equality in Swift, this wrapper class is used with a function name
 to test for equality.
 http://stackoverflow.com/questions/24111984/how-do-you-test-functions-and-closures-for-equality
 https://devforums.apple.com/message/1035180#1035180
 */
open class EventHandler {
    var function:(Event)->Void
    var functionName:String
    public init(_ function:@escaping (Event)->Void,_ functionName:String) {
        self.function = function
        self.functionName = functionName
    }
}
