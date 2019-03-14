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
    var label: UILabel!
    //var textField: UITextField
    
    init(frame: CGRect, withHint hint: String) {
        label = UILabel(frame: CGRect(x: 0, y: -30, width: 200, height: 30))
        //textField = UITextField(frame: CGRect(x: frame.minX, y: label.frame.maxY, width: frame.width, height: frame.height - 30))
        super.init(frame: CGRect(x: frame.minX, y: frame.minY + 30, width: frame.width, height: frame.height))
        
        setupLabel(withText: hint)
        setupTextField(withHint: hint)
        
        self.addSubview(label)
        //self.addSubview(textField)
        //self.bringSubview(toFront: textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
        
        self.isEnabled = true
    }
    
//    func setupTextField(withHint hint: String) {
//        //self.bounds = CGRect(x: frame.minX, y: frame.minY, width: 300, height: 40)
//        textField.placeholder = "Enter text here"
//        textField.font = UIFont.systemFont(ofSize: 15)
//        textField.borderStyle = UITextField.BorderStyle.roundedRect
//        textField.autocorrectionType = UITextAutocorrectionType.no
//        textField.keyboardType = UIKeyboardType.default
//        textField.returnKeyType = UIReturnKeyType.done
//        textField.clearButtonMode = UITextField.ViewMode.whileEditing
//        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        textField.placeholder = hint
//
//        textField.isEnabled = true
//    }
    
    func setupLabel(withText text: String) {
        label.text = text
    }
}
