//
//  BaseTabViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class BaseTabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let offset: CGFloat = 87
        self.view.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY + offset, width: self.view.frame.width, height: self.view.frame.height)
    }
}
