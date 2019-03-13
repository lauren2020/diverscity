//
//  BaseNavigationItemViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationItemViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let offset: CGFloat = 43
        self.view.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY + offset, width: self.view.frame.width, height: self.view.frame.height)
//        let offset: CGFloat = 60
//        self.view.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY + offset, width: self.view.frame.width, height: self.view.frame.height - offset)
    }
}
