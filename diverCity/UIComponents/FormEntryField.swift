//
//  FormEntryField.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

public class FormEntryField: UITextField {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField(withHint hint: String, atX x: CGFloat, atY y: CGFloat) {
        self.bounds = CGRect(x: x, y: y, width: 300, height: 40)
        self.text = hint
    }
}
