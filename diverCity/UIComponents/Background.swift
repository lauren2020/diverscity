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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackground(forView view: UIView, withImage image: UIImage) {
        self.bounds = view.bounds
        let imageView = UIImageView()
        imageView.image = image
        imageView.bounds = self.bounds
        self.addSubview(imageView)
        view.addSubview(self)
    }
}
