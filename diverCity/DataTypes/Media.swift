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
    var image: UIImage
    var date: Date
    var title: String
    var user: User
    
    init(image: UIImage, date: Date, title: String, user: User) {
        self.image = image
        self.date = date
        self.title = title
        self.user = user
    }
}
