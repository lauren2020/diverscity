//
//  Tag.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/13/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class Tag {
    var id = 0
    var label: String!
    var color: UIColor!
    var selected: Bool = false
    
    init(id: Int, label: String, colorCode: Int) {
        self.id = id
        self.label = label
        switch colorCode {
        case 0:
            self.color = UIColor.blue
        case 1:
            self.color = UIColor.green
        case 2:
            self.color = UIColor.purple
        case 3:
            self.color = UIColor.lightGray
        case 4:
            self.color = UIColor.yellow
        case 5:
            self.color = UIColor.red
        case 6:
            self.color = UIColor.orange
        case 7:
            self.color = UIColor.brown
        case 8:
            self.color = UIColor.cyan
        case 9:
            self.color = UIColor.magenta
        default:
            self.color = UIColor.blue
        }
    }
}
