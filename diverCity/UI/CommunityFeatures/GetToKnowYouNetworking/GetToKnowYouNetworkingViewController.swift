//
//  GetToKnowYouNetworkingViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class GetToKNowYouNetworkingViewController: BaseTabViewController {
    var header: CommunityHeader!
    var backButton: MenuItemButton!
    var recomendedConnectionsCollectionView: UsersCollectionView!
    var membersSearchBar: UISearchBar!
    var membersTable: UsersTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GTKY Networking"
        self.view.backgroundColor = UIColor.gray
        setupViews()
    }
    
    func setupViews() {
        backButton = MenuItemButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30), withTaskName: "Back")
        header = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: "Get To Know You", withMenuOptions: [backButton])
        
        let recommendedConnections: [User] = []
        let members: [User] = []
        
        recomendedConnectionsCollectionView = UsersCollectionView(frame: CGRect(x: self.view.frame.minX, y: header.frame.maxY, width: self.view.frame.width, height: 200), usersList: recommendedConnections, userSelectedCallback: { user in
            
        })
        
        membersSearchBar = UISearchBar(frame: CGRect(x: self.view.frame.minX, y: recomendedConnectionsCollectionView.frame.maxY, width: self.view.frame.width, height: 50))
        membersTable = UsersTableView(frame: CGRect(x: self.view.frame.minX, y: membersSearchBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - membersSearchBar.frame.maxY), usersList: members, userSelectedCallback: {user in
        })
        
        self.view.addSubview(header)
        self.view.addSubview(recomendedConnectionsCollectionView)
        self.view.addSubview(membersSearchBar)
        self.view.addSubview(membersTable)
    }
}
