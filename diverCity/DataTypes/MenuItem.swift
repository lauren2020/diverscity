//
//  MenuItem.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MenuItem {
    var icon: UIImage?
    var title: String!
    var selector: Selector
    init(title: String, selector: Selector, icon: UIImage?) {
        self.icon = icon
        self.title = title
        self.selector = selector
    }
}
