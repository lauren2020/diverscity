//
//  CreateNewCommunityViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 11/7/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CreateNewCommunityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var privacyTypeSelector: UISegmentedControl!
    @IBOutlet weak var featuresTable: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var features:[CommunityFeature] = [CommunityFeature(name: "Ambassador Program", description: "", id: "0"), CommunityFeature(name: "Events Board", description: "", id: "1"), CommunityFeature(name: "Events Map", description: "", id: "2"), CommunityFeature(name: "Carpool Coordination", description: "", id: "3"), CommunityFeature(name: "Get To Know You", description: "", id: "4")]
    
    var selectedFeatures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        featuresTable.delegate = self
        featuresTable.dataSource = self
        
        privacyTypeSelector.removeAllSegments()
        privacyTypeSelector.insertSegment(withTitle: "Public", at: 0, animated: true)
        privacyTypeSelector.insertSegment(withTitle: "Private", at: 1, animated: true)
        privacyTypeSelector.insertSegment(withTitle: "Secret", at: 2, animated: true)
        privacyTypeSelector.apportionsSegmentWidthsByContent = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = featuresTable.dequeueReusableCell(withIdentifier: "featureCell")
        cell?.textLabel?.text = features[indexPath.row].name
        cell?.detailTextLabel?.text = features[indexPath.row].description
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UserSession.selectedCommunity = UserSession.user!.communities[indexPath.row]
//        self.performSegue(withIdentifier: "myHomePageToCommunityHomePage", sender: (Any).self)
        featuresTable.deselectRow(at: indexPath, animated: true)
        let cell = featuresTable.cellForRow(at: indexPath)
        //cell?.backgroundColor = UIColor.blue
        if(cell?.backgroundColor == UIColor.blue) {
            features[indexPath.row].selected = false
            cell?.backgroundColor = UIColor.white
        } else {
            //selectedFeatures[indexPath]
            features[indexPath.row].selected = true
            cell?.backgroundColor = UIColor.blue
        }
    }
    
    @IBAction func createCommunity(_ sender: Any) {
        for feature in features {
            if (feature.selected) {
                selectedFeatures.append(String(feature.id))
            }
        }
        var body = ["name=" + nameTextField.text!]
        body.append("description=" + descriptionTextField.text!)
        body.append("privacy_type=" + String(privacyTypeSelector.selectedSegmentIndex))
        body.append("creator=" + (UserSession.user?.id)!)
        body.append("members=" + (UserSession.user?.id)!)
        body.append("events=")
        body.append("features=" + selectedFeatures.joined(separator: ","))

        let postCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: "", methodType: "POST", postContent: APIDelegate.buildPostString(body: body))
        if (postCommunityRequest != nil) {
            APIDelegate.performTask(withRequest: postCommunityRequest!, completion: {json in
                ActivityHelper.stopActivity(view: self.view)
                if (json != nil && json?.count != 0) {
                    do {
                        //UserSession.user?.communities.append(try Community(json: json![0])!)
                        UserSession.selectedCommunity = try Community(json: json![0])
                        let newCommunities = (UserSession.user?.communityIds.joined(separator: ","))! == "" ? (UserSession.selectedCommunity?.id)! : (UserSession.user?.communityIds.joined(separator: ","))! + "," + (UserSession.selectedCommunity?.id)!
                        self.patchUser(newCommunities: newCommunities)
                    } catch {
                        print(error)
                    }
                }
            })
        }
    }
    
    func patchUser(newCommunities: String) {
        let patchUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: (UserSession.user?.id)!, methodType: "PATCH", postContent: APIDelegate.buildPostString(body: ["communities=" + newCommunities]))
        if (patchUserRequest != nil) {
            APIDelegate.performTask(withRequest: patchUserRequest!, completion: {json in
                ActivityHelper.stopActivity(view: self.view)
                if (json != nil && json?.count != 0) {
                    do {
                        UserSession.user = try User(json: json![0])
                        self.performSegue(withIdentifier: "createCommunityToMyHomePage", sender: (Any).self)
                    } catch {
                        print(error)
                    }
                }
            })
        }
    }
    
    @IBAction func backToMyHomePage(_ sender: Any) {
        //createCommunityToMyHomePage
        performSegue(withIdentifier: "createCommunityToMyHomePage", sender: (Any).self)
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
