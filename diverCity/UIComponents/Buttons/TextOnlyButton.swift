//
//  TextOnlyButton.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

public class TextOnlyButton: UIButton {
    init(frame: CGRect, withText text: String) {
        super.init(frame: frame)
        setupButton(withText: text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(withText text: String) {
        self.backgroundColor = UIColor.init(white: 1, alpha: 0)
        self.setTitle(text, for: .normal)
    }
}
