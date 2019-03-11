//
//  Background.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

public class Background: UIView {
    var imageView: UIImageView!
    
    init(frame: CGRect, withImage image: UIImage) {
        super.init(frame: frame)
        imageView = UIImageView(frame: frame)
        imageView.image = image
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
