//
//  UserSessionNavigationController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class UserSessionNavigationController: UINavigationController {
    var myHomePageViewController = MyHomePageViewController()
    var userSettingsViewController = UserSettingsViewController()
    var eventDetailsViewController = EventDetailsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Nav Bar Height: ", self.navigationBar.frame.height)
        
        self.title = "Navigation Controller"
        self.viewControllers = [myHomePageViewController]
    }
}
