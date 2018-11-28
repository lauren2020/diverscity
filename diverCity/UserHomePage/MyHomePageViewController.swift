//
//  MyHomePageViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class MyHomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var myCommunitiesTableList: UITableView!
    
    var menuIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserSession.user?.communities = []
        for communityId in (UserSession.user?.communityIds)! {
            Community.communityInfo(withId: String(communityId), completion: setCommunities)
        }
        closeMenu()
        headerName.text = (UserSession.user?.firstName)! + " " + (UserSession.user?.lastName)!
        myCommunitiesTableList.delegate = self
        myCommunitiesTableList.dataSource = self
    }
    
    func setCommunities(newCommunity: Community?) {
        if (newCommunity != nil) {
            UserSession.user?.communities.append(newCommunity!)
        } else {
            print("Failed to retrieve community!")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserSession.user!.communities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myCommunitiesTableList.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = UserSession.user!.communities[indexPath.row].name
        cell?.detailTextLabel?.text = UserSession.user!.communities[indexPath.row].description
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserSession.selectedCommunity = UserSession.user!.communities[indexPath.row]
        //myHomePageToCommunity
        //myHomePageToCommunityHomePage
        self.performSegue(withIdentifier: "myHomePageToCommunityHomePage", sender: (Any).self)
    }
    
    @IBAction func toggleMenu(_ sender: Any) {
        if(menuIsOpen) {
            closeMenu()
        } else {
            openMenu()
        }
    }
    
    func openMenu() {
        menuIsOpen = true
        logoutButton.isHidden = false
    }
    
    func closeMenu() {
        menuIsOpen = false
        logoutButton.isHidden = true
    }
    
    @IBAction func reloadCommunities(_ sender: Any) {
        //print(UserSession.user?.communities)
        myCommunitiesTableList.reloadData()
    }
    //myHomePageToCreateCommunity
    @IBAction func createNewCommunity(_ sender: Any) {
        performSegue(withIdentifier: "myHomePageToCreateCommunity", sender: (Any).self)
    }
    
    @IBAction func goToFindCommunities(_ sender: Any) {
        //myHomePageToCommunityDiscovery
        //myHomePageToFindCommunities
        performSegue(withIdentifier: "myHomePageToCommunityDiscovery", sender: (Any).self)
    }
    
    @IBAction func logoutOfAccount(_ sender: Any) {
        performSegue(withIdentifier: "myHomePageToWelcome", sender: (Any).self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
