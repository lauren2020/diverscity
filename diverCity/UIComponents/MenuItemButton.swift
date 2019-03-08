//
//  MenuItemButton.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/7/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MenuItemButton: UIButton {
    init(frame: CGRect, withTaskName task: String) {
        super.init(frame: frame)
        self.setTitle(task, for: .normal)
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
