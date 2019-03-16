//
//  TaggedButton.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/15/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class TaggedButton: UIButton {
    var counter: UILabel!
    init(frame: CGRect, icon: UIImage) {
        super.init(frame: frame)
        self.setBackgroundImage(icon, for: .normal)
        
        counter = UILabel(frame: CGRect(x: self.frame.width - 10, y: self.frame.minY - 10, width: 15, height: 15))
        counter.text = "0"
        counter.textAlignment = .center
        counter.textColor = UIColor.white
        counter.layer.backgroundColor = UIColor.red.cgColor
        //counter.backgroundColor = UIColor.red
        counter.layer.cornerRadius = 5
        addSubview(counter)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
