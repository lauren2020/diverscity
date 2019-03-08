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
    //var discoverCommunitiesViewController =
    var createNewCommunityViewController = CreateNewCommunityViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        findCommunitiesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        createNewCommunityViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        
        //        groupListViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(named: "groups-icon"), tag: 0)
        //        receiptScannerViewController.tabBarItem = UITabBarItem(title: "+ Add", image: UIImage(named: "scanner-icon1"), tag: 2)
        //        addNewReceiptFormViewController.tabBarItem = UITabBarItem(title: "Receipts", image: UIImage(named: "receipt-icon1"), tag: 1)
        //
        //        spendingReportViewController.tabBarItem = UITabBarItem(title: "Report", image: UIImage(named: "report-icon"), tag: 3)
        
        let tabBarList = [findCommunitiesViewController, createNewCommunityViewController]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}
