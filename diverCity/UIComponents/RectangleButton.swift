//
//  RectangleButton.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

public class RectangleButton: UIButton {
    init(frame: CGRect, withText text: String) {
        super.init(frame: frame)
        setupButton(withText: text, frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(withText text: String, frame: CGRect) {
        self.bounds = CGRect(x: frame.minX, y: frame.minY, width: 150, height: 40)
        self.setTitle(text, for: .normal)
        self.backgroundColor = UIColor.blue
    }
}
