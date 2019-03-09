//
//  CommunityHomeViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/15/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CommunityHomeViewController: BaseTabViewController {
    var communityCover: CommunityHeader!
    var scrollView: UIScrollView!
    var divider: UIView!
    var background: Background!
    //var menuIconButton: MenuIconButton!
    var backToHomeButton: MenuItemButton!
    //var communityTitle: UITextView!
    var addUserToCommunityButton: UIButton!
    
    var trendingEventsTag: ObjectLabelTag!
    var trendingEventsTable: UITableView!
    
    //var addPostButton: RectangleButton!
    var postsTableTag: ObjectLabelTag!
    var postsTable: UITableView!
    
    var menuIsOpen = false
    //Owner, Admin, Member, Visitor
    enum Permission {
        case OWNER
        case ADMIN
        case MEMBER
        case VISITOR
    }
    var PERMISSION = Permission.VISITOR
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        setPermissions()
        setupViews()
        updateLayoutForPermissions()
    }
    
    func setupViews() {
        if (PERMISSION == Permission.VISITOR) {
            setupBaseViewForVisitor()
        } else {
            setupBaseViewForNonVisitor()
        }
        scrollView.isScrollEnabled = true
        
        trendingEventsTag = ObjectLabelTag(frame: CGRect(x: scrollView.frame.minX, y: 0, width: 200, height: 40), withLabel: "Trending Events")
        trendingEventsTable = UITableView(frame: CGRect(x: scrollView.frame.minX, y: trendingEventsTag.frame.maxY, width: scrollView.frame.width, height: 200))
        trendingEventsTable.register(EventTableCell.self, forCellReuseIdentifier: "eventCell")
        
        postsTableTag = ObjectLabelTag(frame: CGRect(x: scrollView.frame.minX, y: trendingEventsTable.frame.maxY, width: 200, height: 40), withLabel: "Community Feed")
        postsTable = UITableView(frame: CGRect(x: scrollView.frame.minX, y: postsTableTag.frame.maxY, width: scrollView.frame.width, height: 500))
        postsTable.register(PostTableCell.self, forCellReuseIdentifier: "postCell")
        
        scrollView.addSubview(trendingEventsTag)
        scrollView.addSubview(trendingEventsTable)
        scrollView.addSubview(postsTableTag)
        scrollView.addSubview(postsTable)
    }
    
    func setupBaseViewForVisitor() {
        addUserToCommunityButton = RectangleButton(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 50), withText: "+ Add To My Communities")
        addUserToCommunityButton.addTarget(self, action: #selector(addUserToCommunity), for: .touchUpInside)
        background = Background(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        background.setupBackground(forView: self.view, withImage: UIImage(named: "omaha1") ?? UIImage())
        
        backToHomeButton = MenuItemButton(frame: CGRect(x: self.view.frame.maxX - 150, y: self.view.frame.minY, width: 150, height: 30), withTaskName: "Back")
        backToHomeButton.addTarget(self, action: #selector(backToHomePage), for: .touchUpInside)

        communityCover = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: addUserToCommunityButton.frame.maxY, width: self.view.frame.width, height: 100), withTitle: UserSession.selectedCommunity?.name ?? "My Community", withMenuOptions: [backToHomeButton])
        
        scrollView = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: communityCover.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - communityCover.frame.maxY))
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        
        divider = UIView(frame: CGRect(x: self.view.frame.minX, y: communityCover.frame.maxY - 5, width: self.view.frame.width, height: 5))
        divider.backgroundColor = UIColor.darkGray
        
        self.view.addSubview(background)
        self.view.addSubview(addUserToCommunityButton)
        self.view.addSubview(communityCover)
        self.view.addSubview(scrollView)
        self.view.bringSubview(toFront: scrollView)
        self.view.addSubview(divider)
    }
    
    func setupBaseViewForNonVisitor() {
        addUserToCommunityButton = RectangleButton(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 50), withText: "+ Add To My Communities")
        addUserToCommunityButton.addTarget(self, action: #selector(addUserToCommunity), for: .touchUpInside)
        addUserToCommunityButton.isHidden = true
        //////////////
        background = Background(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        background.setupBackground(forView: self.view, withImage: UIImage(named: "omaha1") ?? UIImage())

        backToHomeButton = MenuItemButton(frame: CGRect(x: self.view.frame.maxX - 40, y: self.view.frame.minY, width: 400, height: 20), withTaskName: "Back To Home")
        backToHomeButton.addTarget(self, action: #selector(backToHomePage), for: .touchUpInside)
        
        communityCover = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: UserSession.selectedCommunity?.name ?? "My Community", withMenuOptions: [backToHomeButton])
        
        scrollView = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: communityCover.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - communityCover.frame.maxY))
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
        
        divider = UIView(frame: CGRect(x: self.view.frame.minX, y: communityCover.frame.maxY - 5, width: self.view.frame.width, height: 5))
        divider.backgroundColor = UIColor.darkGray
        
        self.view.addSubview(background)
        self.view.addSubview(communityCover)
        self.view.addSubview(scrollView)
        self.view.bringSubview(toFront: scrollView)
        self.view.addSubview(divider)
    }
    
    func updateLayoutForPermissions() {
        setPermissions()
        if(PERMISSION == Permission.OWNER) {
            addUserToCommunityButton.isHidden = true
        } else if (PERMISSION == Permission.MEMBER) {
            addUserToCommunityButton.isHidden = true
        } else if (PERMISSION == Permission.VISITOR) {
            addUserToCommunityButton.isHidden = false
        }
    }
    
    func setPermissions() {
        if(userIsOwner()) {
            PERMISSION = Permission.OWNER
        } else if(userIsAdmin()) {
            PERMISSION = Permission.ADMIN
        } else if(userIsGeneralMember()) {
            PERMISSION = Permission.MEMBER
        } else {
            PERMISSION = Permission.VISITOR
        }
    }
    
    func userIsOwner() -> Bool {
        if(UserSession.selectedCommunity?.creator == UserSession.user?.id) {
            return true
        }
        return false
    }
    func userIsAdmin() -> Bool {
        if(UserSession.selectedCommunity?.creator == UserSession.user?.id) {
            return true
        }
        return false
    }
    func userIsGeneralMember() -> Bool {
        for id in (UserSession.selectedCommunity?.members)! {
            if (id == UserSession.user?.id) {
                return true
            }
        }
        return false
    }
    
    @objc func addUserToCommunity(_ sender: Any) {
        let newMembers = (UserSession.selectedCommunity?.members.joined(separator: ","))! == "" ? (UserSession.user?.id)! : (UserSession.selectedCommunity?.members.joined(separator: ","))! + "," + (UserSession.user?.id)!
        //Community.patch(id: (UserSession.selectedCommunity?.id)!, body: ["members=" + newMembers], completion: patchCommunityCompletion)
        ActivityHelper.startActivity(view: self.view)
        let content = APIDelegate.buildPostString(body: ["members=" + newMembers])
        let patchCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: (UserSession.selectedCommunity?.id)!, methodType: "PATCH", postContent: content)
        if (patchCommunityRequest != nil) {
            APIDelegate.performTask(withRequest: patchCommunityRequest!, completion: {json in
                if (json != nil && json?.count != 0) {
                    do {
                        self.patchCommunityCompletion(community: try Community(json: json![0]))
                    } catch {
                        ActivityHelper.stopActivity(view: self.view)
                        print(error)
                    }
                }
            })
        }
    }
    
    func patchCommunityCompletion(community: Community?) {
        if(community != nil) {
            UserSession.selectedCommunity = community
            let community = UserSession.selectedCommunity
            let newCommunities = (UserSession.user?.communities.joined(separator: ","))! == "" ? (community?.id) : (UserSession.user?.communities.joined(separator: ","))! + "," + (community?.id)!
            //User.patch(id: (UserSession.user?.id)!, body: ["communities=" + newCommunities!], completion: patchUserCompletion)
            //startActivity()
            let content = APIDelegate.buildPostString(body: ["communities=" + newCommunities!])
            let patchUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: (UserSession.user?.id)!, methodType: "PATCH", postContent: content)
            if (patchUserRequest != nil) {
                APIDelegate.performTask(withRequest: patchUserRequest!, completion: {json in
                    ActivityHelper.stopActivity(view: self.view)
                    if (json != nil && json?.count != 0) {
                        do {
                            UserSession.user = try User(json: json![0])
                            print("Community added to user!")
                            self.openPopUp(type: 0, displayText: "Congratulations! You have joined " + (UserSession.selectedCommunity?.name)!)
                            self.updateLayoutForPermissions()
                        } catch {
                            print(error)
                        }
                    } else {
                        ActivityHelper.stopActivity(view: self.view)
                    }
                })
            } else {
                ActivityHelper.stopActivity(view: self.view)
            }
            print("User Added to Community!")
        } else {
            ActivityHelper.stopActivity(view: self.view)
            print("Unable to add member to community!")
        }
    }
    
//    func patchUserCompletion(user: User?) {
//        if(user != nil) {
//            UserSession.user = user
//            print("Community added to user!")
//            openPopUp(type: 0, displayText: "Congratulations! You have joined " + (UserSession.selectedCommunity?.name)!)
//            updateLayoutForPermissions()
//            //performSegue(withIdentifier: "createCommunityToMyHomePage", sender: (Any).self)
//        } else {
//            print("Unable to add community to member!")
//        }
//    }
    
    func openPopUp(type: Int, displayText: String) {
        if (type == 0) {
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GenericAlertMessage") as! AlertMessageViewController
            popOverVC.displayText = displayText
            self.addChildViewController(popOverVC)
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        }
    }
    
//    @objc func toggleMenu(_ sender: Any) {
//        print("Toggle Menu")
//        if(menuIsOpen) {
//            closeMenu()
//        } else {
//            openMenu()
//        }
//    }
    
    @objc func backToHomePage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    func openMenu() {
//        menuIsOpen = true
//        backToHomeButton.isHidden = false
//    }
//
//    func closeMenu() {
//        menuIsOpen = false
//        backToHomeButton.isHidden = true
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
