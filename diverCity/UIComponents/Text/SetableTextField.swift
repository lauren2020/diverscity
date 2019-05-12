//
//  SetableTextField.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/13/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class SetableTextField: UITextView {
    var hintLabel: UILabel!
    var isEditing: Bool!
    var editingDisabled: Bool = false
    
    init(frame: CGRect, hint: String, defaultEditing: Bool) {
        hintLabel = UILabel(frame: CGRect(x: 0, y: -30, width: 100, height: 30))
        let adjustedFrame = CGRect(x: frame.minX, y: frame.minY + 30, width: frame.width, height: frame.height)
        super.init(frame: adjustedFrame, textContainer: nil)
        hintLabel.backgroundColor = UIColor.lightGray
        hintLabel.textColor = UIColor.black
        hintLabel.text = hint
        
        defaultEditing ? setTextFieldEditing() : setTextFieldNotEditing()
        layer.borderWidth = 2
        self.addSubview(hintLabel)
    }
    
    // TODO: Switch this out for custom setable switch trigger
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        (isEditing && !editingDisabled) ? setTextFieldNotEditing() : setTextFieldEditing()
    }
    
    func setTextFieldEditing() {
        isEditing = true
        isEditable = true
        layer.borderColor = UIColor.black.cgColor
       // backgroundColor = UIColor.gray
    }
    
    func setTextFieldNotEditing() {
        isEditing = false
        isEditable = false
        layer.borderColor = UIColor.lightGray.cgColor
        //backgroundColor = UIColor.white
    }
    
    func setEditingDisabled() {
        editingDisabled = true
        textColor = UIColor.gray
    }
    
    func setEditingEnabled() {
        editingDisabled = false
        setTextFieldNotEditing()
        textColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
