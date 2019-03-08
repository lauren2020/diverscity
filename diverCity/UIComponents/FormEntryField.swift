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
    init(frame: CGRect, withHint hint: String) {
        super.init(frame: frame)
        setupTextField(withHint: hint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTextField(withHint hint: String) {
        //self.bounds = CGRect(x: frame.minX, y: frame.minY, width: 300, height: 40)
        self.placeholder = "Enter text here"
        self.font = UIFont.systemFont(ofSize: 15)
        self.borderStyle = UITextField.BorderStyle.roundedRect
        self.autocorrectionType = UITextAutocorrectionType.no
        self.keyboardType = UIKeyboardType.default
        self.returnKeyType = UIReturnKeyType.done
        self.clearButtonMode = UITextField.ViewMode.whileEditing
        self.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.placeholder = hint
    }
}
