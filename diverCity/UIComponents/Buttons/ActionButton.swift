//
//  ActionButton.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    init(x: CGFloat, y: CGFloat, icon: String) {
        super.init(frame: CGRect(x: x, y: y, width: 30, height: 30))
        
        self.setImage(UIImage(named: icon), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
