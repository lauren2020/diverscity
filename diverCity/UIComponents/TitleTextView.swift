//
//  TitleTextView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class TitleTextView: UILabel {
    
    init(frame: CGRect, withTitle title: String) {
        super.init(frame: frame)
        setupTitle(text: title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitle(text: String) {
        self.text = text
        self.backgroundColor = UIColor.init(white: 1, alpha: 0)
        self.textAlignment = NSTextAlignment.left
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 36)
    }
}
