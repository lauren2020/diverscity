//
//  MenuIconButton.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/7/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MenuIconButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("|||", for: .normal)
        self.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
