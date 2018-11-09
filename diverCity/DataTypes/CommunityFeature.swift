//
//  CommunityFeature.swift
//  diverCity
//
//  Created by Lauren Shultz on 11/7/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import Foundation

struct CommunityFeature {
    var id: String
    var name: String
    var description: String
    var selected = false
    
    init(name: String, description: String, id: String) {
        self.name = name
        self.description = description
        self.id = id
    }
}
