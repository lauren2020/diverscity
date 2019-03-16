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
//        myHomePageViewController.view.frame = CGRect(x: myHomePageViewController.view.frame.minX, y: myHomePageViewController.view.frame.minY + self.navigationBar.frame.height, width: myHomePageViewController.view.frame.width, height: myHomePageViewController.view.frame.height - self.navigationBar.frame.height)
//        userSettingsViewController.view.frame = CGRect(x: userSettingsViewController.view.frame.minX, y: userSettingsViewController.view.frame.minY + self.navigationBar.frame.height, width: userSettingsViewController.view.frame.width, height: userSettingsViewController.view.frame.height - self.navigationBar.frame.height)
//        eventDetailsViewController.view.frame = CGRect(x: eventDetailsViewController.view.frame.minX, y: eventDetailsViewController.view.frame.minY + self.navigationBar.frame.height, width: eventDetailsViewController.view.frame.width, height: eventDetailsViewController.view.frame.height - self.navigationBar.frame.height)
        
        self.title = "Navigation Controller"
       // self.viewControllers = [myHomePageViewController, userSettingsViewController, eventDetailsViewController]
        self.viewControllers = [myHomePageViewController]
        
//        popViewController(animated: true)
//        popViewController(animated: true)
    }
}
