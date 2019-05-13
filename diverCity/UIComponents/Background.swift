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
    var blurLayer: UIView!
    
    init(frame: CGRect, withImage image: UIImage) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        imageView = UIImageView(frame: frame)
        imageView.image = image
        blurLayer = UIView(frame: frame)
        blurLayer.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        self.addSubview(imageView)
        self.addSubview(blurLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func blur(alpha: CGFloat) {
        blurLayer.backgroundColor = UIColor(white: 1.0, alpha: alpha)
    }
}
