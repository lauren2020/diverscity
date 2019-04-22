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

    var tagsTitle: UITextView!
    var featuresTitle: UITextView!
    var tagsTable: TagsTableSelector!
    var privacyTypeSelector: UISegmentedControl!
    var featuresTable: FeaturesTableSelector!
    var nameTextField: FormEntryField!
    var descriptionTextField: FormEntryField!
    var addressStreetTextField: FormEntryField!
    var cityTextField: FormEntryField!
    var stateTextField: FormEntryField!
    var zipTextField: FormEntryField!
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
//        titleHeader = GenericCover(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: "Create Community", withMenuOptions: [])
//        backButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 60, y: self.view.frame.minX + 60, width: 40, height: 40), withText: "X")
//        backButton.addTarget(self, action: #selector(backToMyHomePage), for: .touchUpInside)
        
        nameTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: self.view.frame.minY + 20, width: self.view.frame.width - 40, height: 40), withHint: "Name")
        descriptionTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: nameTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40), withHint: "Description")
        addressStreetTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: descriptionTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40), withHint: "Street (Optional)")
        cityTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: addressStreetTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40), withHint: "City")
        stateTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: cityTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40), withHint: "State")
        zipTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + 20, y: stateTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40), withHint: "Zip")
        
        privacyTypeSelector = UISegmentedControl(frame: CGRect(x: self.view.frame.minX + 20, y: zipTextField.frame.maxY + 20, width: self.view.frame.width - 40, height: 40))
        privacyTypeSelector.removeAllSegments()
        privacyTypeSelector.insertSegment(withTitle: "Public", at: 0, animated: true)
        privacyTypeSelector.insertSegment(withTitle: "Private", at: 1, animated: true)
        privacyTypeSelector.insertSegment(withTitle: "Secret", at: 2, animated: true)
        privacyTypeSelector.apportionsSegmentWidthsByContent = true
        
        featuresTitle = UITextView(frame: CGRect(x: self.view.frame.minX, y: privacyTypeSelector.frame.maxY + 10, width: self.view.frame.width, height: 30))
        featuresTitle.backgroundColor = UIColor.init(displayP3Red: 128, green: 128, blue: 128, alpha: 0.5)
        featuresTitle.text = "Features"
        featuresTable = FeaturesTableSelector(frame: CGRect(x: self.view.frame.minX, y: featuresTitle.frame.maxY, width: self.view.frame.width, height: 200))
        
        tagsTitle = UITextView(frame: CGRect(x: self.view.frame.minX, y: featuresTable.frame.maxY, width: self.view.frame.width, height: 30))
        tagsTitle.text = "Tags"
        tagsTitle.backgroundColor = UIColor.init(displayP3Red: 128, green: 128, blue: 128, alpha: 0.5)
        tagsTable = TagsTableSelector(frame: CGRect(x: self.view.frame.minX, y: tagsTitle.frame.maxY, width: self.view.frame.width, height: 200))
        //featuresTable = UITableView(frame: CGRect(x: self.view.frame.minX, y: privacyTypeSelector.frame.maxY + 10, width: self.view.frame.width, height: 200), style: UITableViewStyle.plain)
        //featuresTable.register(UITableViewCell.self, forCellReuseIdentifier: "featureCell")
        
        createButton = RectangleButton(frame: CGRect(x: self.view.frame.minX, y: tagsTable.frame.maxY + 10, width: self.view.frame.width, height: 50), withText: "Create")
        createButton.addTarget(self, action: #selector(createCommunity), for: .touchUpInside)
        
        scrollView = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height - 200))
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: createButton.frame.maxY)
        
        self.view.addSubview(scrollView)
        //scrollView.addSubview(titleHeader)
        //scrollView.addSubview(backButton)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(descriptionTextField)
        scrollView.addSubview(addressStreetTextField)
        scrollView.addSubview(cityTextField)
        scrollView.addSubview(stateTextField)
        scrollView.addSubview(zipTextField)
        scrollView.addSubview(privacyTypeSelector)
        scrollView.addSubview(featuresTitle)
        scrollView.addSubview(featuresTable)
        scrollView.addSubview(tagsTitle)
        scrollView.addSubview(tagsTable)
        scrollView.addSubview(createButton)
    }
    
    @objc func createCommunity(_ sender: Any) {
        for feature in featuresTable.featuresList {
            if (feature.selected) {
                featuresTable.selectedFeatures.append(String(feature.id))
            }
        }
        var body = ["name=" + nameTextField.text!]
        body.append("description=" + descriptionTextField.text!)
        body.append("privacy_type=" + String(privacyTypeSelector.selectedSegmentIndex))
        body.append("creator=" + UserSession.user.id)
        body.append("members=" + UserSession.user.id)
        var citytext = "," + (cityTextField.text ?? "") + ","
        var statezip = stateTextField.text ?? "" + "," + (zipTextField.text ?? "")
        var address = "address=" + (addressStreetTextField.text ?? "") + citytext + statezip
        body.append(address)
        body.append("tags=" + tagsTable.selectedTags.joined(separator: ","))
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
                        //let homePageViewController = MyHomePageViewController()
                        let userSessionNavigationController = UserSessionNavigationController()
                        self.present(userSessionNavigationController, animated: true, completion: nil)
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
