//
//  FindCommunitiesViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class FindCommunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchCommunitiesBar: UISearchBar!
    
    @IBOutlet weak var searchResults: UITableView!
    var communities: [Community] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Community.all(completion: completion)
        searchResults.delegate = self
        searchResults.dataSource = self
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
        self.performSegue(withIdentifier: "findCommunitiesToCommunityTabs", sender: (Any).self)
//        let community = communities[indexPath.row]
//        let newCommunities = (UserSession.user?.communityIds.joined(separator: ","))! == "" ? (community.id) : (UserSession.user?.communityIds.joined(separator: ","))! + "," + (community.id)
//        User.patch(id: (UserSession.user?.id)!, body: ["communities=" + newCommunities], completion: patchUserCompletion)
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
    
    func completion(communities: [Community]) {
        //print("FOUND COMMUNITIES: ", communitiesIn)
        self.communities = communities
        searchResults.reloadData()
    }

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
