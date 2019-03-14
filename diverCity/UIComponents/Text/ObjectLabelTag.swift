//
//  ObjectLabelTag.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/7/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class ObjectLabelTag: UILabel {
    init(frame: CGRect, withLabel label: String) {
        super.init(frame: frame)
        self.text = label
        self.layoutMargins = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 0)
        self.layoutMarginsDidChange()
        self.backgroundColor = UIColor.init(red: 169, green: 169, blue: 169, alpha: 0.8)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
