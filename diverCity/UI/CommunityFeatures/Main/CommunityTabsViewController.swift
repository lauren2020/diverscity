//
//  CommunityTabsViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/7/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class CommunityTabsViewController: UITabBarController {
    var communityHomeViewController = CommunityHomeViewController()
    var communityEventsViewController = CommunityEventsViewController()
    var getToKnowYouNetworkingViewController = GetToKNowYouNetworkingViewController()
    
    var rootNavigationController: UINavigationController?
    
//    init(rootNavigationController: UINavigationController) {
//        self.rootNavigationController = rootNavigationController
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        communityHomeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "HomeTabIcon"), tag: 0)
        communityEventsViewController.tabBarItem = UITabBarItem(title: "Events", image: UIImage(named: "StarTabIcon"), tag: 1)
        getToKnowYouNetworkingViewController.tabBarItem = UITabBarItem(title: "GTYK", image: UIImage(named: "ChainLinkTabIcon"), tag: 2)
        
        let tabBarList = [communityHomeViewController, communityEventsViewController, getToKnowYouNetworkingViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
    
}
