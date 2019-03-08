//
//  FindCommunitiesViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class FindCommunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var titleView: UITextView!
    var backButton: RectangleButton!
    var searchCommunitiesBar: UISearchBar!
    var searchResults: UITableView!
    
    var communities: [Community] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Find Communities"
        self.view.backgroundColor = UIColor.white
        self.view.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY + ((self.navigationController != nil) ? ((self.navigationController?.navigationBar.frame.height)!) : 50) , width: self.view.frame.width, height: self.view.frame.height - (self.tabBarController!.tabBar.frame.height) - ((self.navigationController != nil) ? ((self.navigationController?.navigationBar.frame.height)!) : 50))
        setupViews()
        // Do any additional setup after loading the view.
        //Community.all(completion: completion)
        let getAllCommunitiesRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: "", methodType: "GET", postContent: nil)
        if (getAllCommunitiesRequest != nil) {
            APIDelegate.performTask(withRequest: getAllCommunitiesRequest!, completion: {json in
                ActivityHelper.stopActivity(view: self.view)
                if (json != nil && json?.count != 0) {
                    do {
                        self.communities = []
                        for community in json! {
                            self.communities.append(try Community(json: community)!)
                        }
                        self.searchResults.reloadData()
                    } catch {
                        print(error)
                    }
                }
            })
        }
        
        searchResults.delegate = self
        searchResults.dataSource = self
    }
    
    func setupViews() {
        titleView = UITextView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: 300, height: 100))
        titleView.text = "Find Communities"
        titleView.backgroundColor = UIColor.init(white: 1, alpha: 0)
        titleView.textAlignment = NSTextAlignment.center
        titleView.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        
        backButton = RectangleButton(frame: CGRect(x: self.view.frame.maxX - 30, y: self.view.frame.minY + 40, width: 30, height: 30), withText: "<--")
        backButton.addTarget(self, action: #selector(navigateBackToHomePage), for: .touchUpInside)
        
        searchCommunitiesBar = UISearchBar(frame: CGRect(x: self.view.frame.minX, y: titleView.frame.maxY, width: self.view.frame.width, height: 40))
        searchResults = UITableView(frame: CGRect(x: self.view.frame.minX, y: searchCommunitiesBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - searchCommunitiesBar.frame.maxY))
        searchResults.register(CommunityTableCell.self, forCellReuseIdentifier: "searchResultCell")
        
        self.view.addSubview(titleView)
        self.view.addSubview(backButton)
        self.view.bringSubview(toFront: backButton)
        self.view.addSubview(searchCommunitiesBar)
        self.view.addSubview(searchResults)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResults.dequeueReusableCell(withIdentifier: "searchResultCell")
        cell?.textLabel?.text = communities[indexPath.row].name
        cell?.detailTextLabel?.text = communities[indexPath.row].description
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UserSession.selectedCommunity = UserSession.user!.communities[indexPath.row]
        print("Clicked!")
        UserSession.selectedCommunity = communities[indexPath.row]
        let communityTabsViewController = CommunityTabsViewController()
        present(communityTabsViewController, animated: true, completion: nil)
        //self.performSegue(withIdentifier: "findCommunitiesToCommunityTabs", sender: (Any).self)
//        let community = communities[indexPath.row]
//        let newCommunities = (UserSession.user?.communityIds.joined(separator: ","))! == "" ? (community.id) : (UserSession.user?.communityIds.joined(separator: ","))! + "," + (community.id)
//        User.patch(id: (UserSession.user?.id)!, body: ["communities=" + newCommunities], completion: patchUserCompletion)
    }
    
    @objc func navigateBackToHomePage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //self.navigationController?.popViewController(animated: true)
    }
    
//    func patchUserCompletion(user: User?) {
//        if(user != nil) {
//            UserSession.user = user
//            print("Community added to user!")
//            //performSegue(withIdentifier: "createCommunityToMyHomePage", sender: (Any).self)
//        } else {
//            print("Unable to add community to member!")
//        }
//    }
    
//    func completion(communities: [Community]) {
//        //print("FOUND COMMUNITIES: ", communitiesIn)
//        self.communities = communities
//        searchResults.reloadData()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
