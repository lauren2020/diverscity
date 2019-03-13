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
        
        //myHomePageViewController
        //viewControllers = [myHomePageViewController]
        self.title = "Navigation Controller"
        self.viewControllers = [myHomePageViewController, userSettingsViewController, eventDetailsViewController]
        //self.navigationController?.pushViewController(myHomePageViewController, animated: true)
        //let navigationItemsList = [myHomePageViewController]
       // viewControllers = navigationItemsList.map { UINavigationController(rootViewController: $0) }
    }
}
