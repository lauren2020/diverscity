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
    var myConnectionsHeader: ObjectLabelTag!
    var myConnectionsTableView: UsersTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Connections"
        self.view.backgroundColor = UIColor.white
        setupViews()
        loadMyConnections()
    }
    
    func setupViews() {
        myConnectionsHeader = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 40), withLabel: "My Connections")
        myConnectionsTableView = UsersTableView(frame: CGRect(x: self.view.frame.minX, y: myConnectionsHeader.frame.maxY, width: self.view.frame.width, height: 550), usersList: [], userSelectedCallback: { (user) in
            let connectionDetailViewController = ConnectionDetailViewController()
            connectionDetailViewController.userInfo = user
            self.navigationController?.pushViewController(connectionDetailViewController, animated: true)
        })
        
        self.view.addSubview(myConnectionsHeader)
        self.view.addSubview(myConnectionsTableView)
    }
    
    func loadMyConnections() {
        var newConnections: [User] = []
        var numberOfConnectionsToLoad = 0
        if (UserSession.user.events_going.count <= UserSession.defaultLoadCountEvents) {
            numberOfConnectionsToLoad = UserSession.user.events_going.count - 1
        } else {
            numberOfConnectionsToLoad = UserSession.defaultLoadCountEvents
        }
        if (numberOfConnectionsToLoad > 0) {
            for index in 0...numberOfConnectionsToLoad {
                //ActivityHelper.startActivity(view: self.view)
                let getEventRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String(UserSession.user.events_going[index]), methodType: "GET", postContent: nil)
                if (getEventRequest != nil) {
                    APIDelegate.performTask(withRequest: getEventRequest!, completion: {json in
                        if (json != nil && json?.count != 0) {
                            do {
                                newConnections.append(try User(json: json![0])!)
                                self.myConnectionsTableView.reloadEvents(users: newConnections)
                            } catch {
                                print(error)
                            }
                        }
                    })
                } else {
                    //|||||||||ActivityHelper.stopActivity(view: self.view)
                }
            }
        }
    }
}
