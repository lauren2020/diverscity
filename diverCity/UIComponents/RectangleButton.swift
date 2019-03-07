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
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(withText text: String, atX x: CGFloat, atY y: CGFloat) {
        self.bounds = CGRect(x: x, y: y, width: 100, height: 40)
        self.setTitle(text, for: .normal)
    }
}
