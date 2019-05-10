//
//  MyConnectionsListViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MyConnectionsListViewController: BaseViewController {
    var viewModel = MyConnectionsListViewModel()
    var activityHelper = ActivityHelper()
    
    var myConnectionsHeader: ObjectLabelTag!
    var myConnectionsTableView: UsersTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Connections"
        self.view.backgroundColor = UIColor.white
        setupViews()
        setupViewModel()
        viewModel.loadMyConnections()
    }
    
    func setupViews() {
        myConnectionsHeader = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 40), withLabel: "My Connections")
        myConnectionsTableView = UsersTableView(frame: CGRect(x: self.view.frame.minX, y: myConnectionsHeader.frame.maxY, width: self.view.frame.width, height: 550), usersList: [], userSelectedCallback: { (user) in
            let connectionDetailViewController = ConnectionDetailViewController()
            connectionDetailViewController.viewModel.userInfo = user
        self.navigationController?.pushViewController(connectionDetailViewController, animated: true)
        })
        
        self.view.addSubview(myConnectionsHeader)
        self.view.addSubview(myConnectionsTableView)
    }
    
    func setupViewModel() {
        viewModel.loadConnectionsEvent.addSubscriber(subscriber: onUpdateConnections)
        viewModel.startActivityEvent.addSubscriber {
            //self.activityHelper.startActivity(view: self.view)
        }
        viewModel.stopActivityEvent.addSubscriber {
            //self.activityHelper.stopActivity(view: self.view)
        }
    }
    
    func onUpdateConnections(newConnections: [User]) {
        self.myConnectionsTableView.reloadEvents(users: newConnections)
    }
}
