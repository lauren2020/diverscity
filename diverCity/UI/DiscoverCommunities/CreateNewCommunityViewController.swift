//
//  CreateNewCommunityViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 11/7/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CreateNewCommunityViewController: BaseTabViewController {
    
    var titleHeader: GenericCover!
    var backButton: TextOnlyButton!
    var scrollView: UIScrollView!

    var privacyTypeSelector: UISegmentedControl!
    var featuresTable: FeaturesTableSelector!
    var nameTextField: FormEntryField!
    var descriptionTextField: FormEntryField!
    var createButton: RectangleButton!
    
    //var features:[CommunityFeature] = [CommunityFeature(name: "Ambassador Program", description: "", id: "0"), CommunityFeature(name: "Events Board", description: "", id: "1"), CommunityFeature(name: "Events Map", description: "", id: "2"), CommunityFeature(name: "Carpool Coordination", description: "", id: "3"), CommunityFeature(name: "Get To Know You", description: "", id: "4")]
    
    //var selectedFeatures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Create Community"
        self.view.backgroundColor = UIColor.white
        setupViews()
        
        //featuresTable.delegate = self
        //featuresTable.dataSource = self
    }
    
    func setupViews() {
        titleHeader = GenericCover(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: "Create Community", withMenuOptions: [])
        backButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 60, y: self.view.frame.minX + 60, width: 40, height: 40), withText: "X")
        backButton.addTarget(self, action: #selector(backToMyHomePage), for: .touchUpInside)
        
        nameTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: titleHeader.frame.maxY + 20, width: self.view.frame.width - 40, height: 40), withHint: "Name")
        descriptionTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: nameTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40), withHint: "Description")
        
        privacyTypeSelector = UISegmentedControl(frame: CGRect(x: self.view.frame.minX + 20, y: descriptionTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40))
        privacyTypeSelector.removeAllSegments()
        privacyTypeSelector.insertSegment(withTitle: "Public", at: 0, animated: true)
        privacyTypeSelector.insertSegment(withTitle: "Private", at: 1, animated: true)
        privacyTypeSelector.insertSegment(withTitle: "Secret", at: 2, animated: true)
        privacyTypeSelector.apportionsSegmentWidthsByContent = true
        
        featuresTable = FeaturesTableSelector(frame: CGRect(x: self.view.frame.minX, y: privacyTypeSelector.frame.maxY + 10, width: self.view.frame.width, height: 200))
        //featuresTable = UITableView(frame: CGRect(x: self.view.frame.minX, y: privacyTypeSelector.frame.maxY + 10, width: self.view.frame.width, height: 200), style: UITableViewStyle.plain)
        //featuresTable.register(UITableViewCell.self, forCellReuseIdentifier: "featureCell")
        
        createButton = RectangleButton(frame: CGRect(x: self.view.frame.midX - 50, y: featuresTable.frame.maxY + 10, width: 100, height: 40), withText: "Create")
        createButton.addTarget(self, action: #selector(createCommunity), for: .touchUpInside)
        
        
        self.view.addSubview(titleHeader)
        self.view.addSubview(backButton)
        self.view.addSubview(nameTextField)
        self.view.addSubview(descriptionTextField)
        self.view.addSubview(privacyTypeSelector)
        self.view.addSubview(featuresTable)
        self.view.addSubview(createButton)
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return features.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = featuresTable.dequeueReusableCell(withIdentifier: "featureCell")
//        cell?.textLabel?.text = features[indexPath.row].name
//        cell?.detailTextLabel?.text = features[indexPath.row].description
//        return cell!
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        featuresTable.deselectRow(at: indexPath, animated: true)
//        let cell = featuresTable.cellForRow(at: indexPath)
//        if(cell?.backgroundColor == UIColor.blue) {
//            features[indexPath.row].selected = false
//            cell?.backgroundColor = UIColor.white
//        } else {
//            features[indexPath.row].selected = true
//            cell?.backgroundColor = UIColor.blue
//        }
//    }
    
    @objc func createCommunity(_ sender: Any) {
        for feature in featuresTable.featuresList {
            if (feature.selected) {
                featuresTable.selectedFeatures.append(String(feature.id))
            }
        }
        var body = ["name=" + nameTextField.text!]
        body.append("description=" + descriptionTextField.text!)
        body.append("privacy_type=" + String(privacyTypeSelector.selectedSegmentIndex))
        body.append("creator=" + (UserSession.user?.id)!)
        body.append("members=" + (UserSession.user?.id)!)
        body.append("events=")
        body.append("requests_to_join=")
        body.append("location_center=")
        body.append("radius=")
        body.append("icon=")
        body.append("images=")
        body.append("features=" + featuresTable.selectedFeatures.joined(separator: ","))

        let postCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: "", methodType: "POST", postContent: APIDelegate.buildPostString(body: body))
        if (postCommunityRequest != nil) {
            APIDelegate.performTask(withRequest: postCommunityRequest!, completion: {json in
                ActivityHelper.stopActivity(view: self.view)
                if (json != nil && json?.count != 0) {
                    do {
                        //UserSession.user?.communities.append(try Community(json: json![0])!)
                        UserSession.selectedCommunity = try Community(json: json![0])
                        let newCommunities = (UserSession.user?.communities.joined(separator: ","))! == "" ? (UserSession.selectedCommunity?.id)! : (UserSession.user?.communities.joined(separator: ","))! + "," + (UserSession.selectedCommunity?.id)!
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
                        let homePageViewController = MyHomePageViewController()
                        self.present(homePageViewController, animated: true, completion: nil)
                    } catch {
                        print(error)
                    }
                }
            })
        }
    }
    
    @objc func backToMyHomePage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
