//
//  TagIndicator.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/13/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class TagIndicator: UILabel {
    init(origin: CGPoint, text: String, color: UIColor) {
        let frame = CGRect(x: origin.x, y: origin.y, width: 100, height: 30)
        super.init(frame: frame)
        
        self.text = text
        self.textAlignment = .center
        self.textColor = UIColor.white
        self.layer.backgroundColor = color.cgColor
        self.layer.cornerRadius = 5
    }
    
    func setTag(tag: Tag) {
        self.text = tag.label
        self.backgroundColor = tag.color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
