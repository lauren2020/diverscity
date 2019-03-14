//
//  Divider.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/13/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class Divider: UIView {
    init(origin: CGPoint, width: CGFloat) {
        let frame = CGRect(x: origin.x, y: origin.y, width: width, height: 2)
        super.init(frame: frame)
        
        backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
