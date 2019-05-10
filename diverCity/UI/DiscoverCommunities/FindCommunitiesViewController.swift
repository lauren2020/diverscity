//
//  FindCommunitiesViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class FindCommunitiesViewController: BaseViewController {
    var activityHelper = ActivityHelper()

    var searchCommunitiesBar: UISearchBar!
    var searchResults: CommunityTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Find Communities"
        self.view.backgroundColor = UIColor.white
        self.view.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY + ((self.navigationController != nil) ? ((self.navigationController?.navigationBar.frame.height)!) : 50) , width: self.view.frame.width, height: self.view.frame.height - (self.tabBarController!.tabBar.frame.height) - ((self.navigationController != nil) ? ((self.navigationController?.navigationBar.frame.height)!) : 50))
        
        setupViews()
        loadCommunities()
    }
    
    func setupViews() {
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(navigateBackToHomePage))]
        
        searchCommunitiesBar = UISearchBar(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 40))
        searchResults = CommunityTableView(frame: CGRect(x: self.view.frame.minX, y: searchCommunitiesBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - searchCommunitiesBar.frame.maxY), communities: [], communitySelectedCallback: { (community) in
            UserSession.selectedCommunity = community
            let communityTabsViewController = CommunityTabsViewController()
            self.present(communityTabsViewController, animated: true, completion: nil)
        })
        
        self.view.addSubview(searchCommunitiesBar)
        self.view.addSubview(searchResults)
    }
    
    func loadCommunities() {
        let getAllCommunitiesRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: "", methodType: "GET", postContent: nil)
        if (getAllCommunitiesRequest != nil) {
            APIDelegate.performTask(withRequest: getAllCommunitiesRequest!, completion: {json in
                self.activityHelper.stopActivity(view: self.view)
                if (json != nil && json?.count != 0) {
                    do {
                        var communities: [Community] = []
                        for community in json! {
                            communities.append(try Community(json: community)!)
                        }
                        self.searchResults.reloadCommunities(communities: communities)
                    } catch {
                        print(error)
                    }
                }
            })
        }
    }
    
    @objc func navigateBackToHomePage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
