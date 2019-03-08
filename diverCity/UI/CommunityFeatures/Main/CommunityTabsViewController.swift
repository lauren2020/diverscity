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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        communityHomeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        communityEventsViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        getToKnowYouNetworkingViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
//        groupListViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(named: "groups-icon"), tag: 0)
//        receiptScannerViewController.tabBarItem = UITabBarItem(title: "+ Add", image: UIImage(named: "scanner-icon1"), tag: 2)
//        addNewReceiptFormViewController.tabBarItem = UITabBarItem(title: "Receipts", image: UIImage(named: "receipt-icon1"), tag: 1)
//
//        spendingReportViewController.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: "report-icon"), tag: 3)
        
        let tabBarList = [communityHomeViewController, communityEventsViewController, getToKnowYouNetworkingViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
    
}
