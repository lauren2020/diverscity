//
//  NewCommunitiesTabsViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class NewCommunitiesTabsViewController: UITabBarController {
    var findCommunitiesViewController = FindCommunitiesViewController()
    var discoverCommunitiesViewController = DiscoverCommunitiesViewController()
    var createNewCommunityViewController = CreateNewCommunityViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        findCommunitiesViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "SearchTabIcon"), tag: 0)
        createNewCommunityViewController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "PlusTabIcon"), tag: 1)
        discoverCommunitiesViewController.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "DiscoverTabIcon"), tag: 2)
        
        let tabBarList = [findCommunitiesViewController, discoverCommunitiesViewController,createNewCommunityViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}
