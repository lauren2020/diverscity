//
//  CoverItemButton.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class CoverItemButton: UIButton {
    init(x: CGFloat, y: CGFloat, icon: UIImage) {
        let frame = CGRect(x: x, y: y, width: 60, height: 60)
        super.init(frame: frame)
        
        self.setImage(icon, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
