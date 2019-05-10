//
//  ActionEvent.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class ActionEvent<T> {
    typealias EventHandler = (T) -> ()
    
    private var eventHandlers = [EventHandler]()
    
    func addSubscriber(subscriber: @escaping EventHandler) {
        eventHandlers.append(subscriber)
    }
    
    func trigger(data: T) {
        for handler in eventHandlers {
            handler(data)
        }
    }
}
