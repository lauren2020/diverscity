//
//  CommunityHomeViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/15/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CommunityHomeViewController: BaseTabViewController {
    //var sidebarMenu: SideBarMenu!
    var communityCover: CommunityHeader!
    var divider: UIView!
    var background: Background!
    var addUserToCommunityButton: UIButton!
//    var trendingEventsTag: ObjectLabelTag!
//    var trendingEventsTable: EventsTableView!
    var postsTableTag: ObjectLabelTag!
    var postsTable: PostsTableView!
    
    var postTableActionBar: UIView!
    var addPostButton: ActionButton!
    var filterPostButton: ActionButton!
    
    let devStubs = DevStubs()
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
        self.title = "Community Home"
        setPermissions()
        setupViews()
        loadTrendingEvents()
        loadCommunityFeed()
        updateLayoutForPermissions()
    }
    
    func setupViews() {
        background = Background(frame: self.view.frame, withImage: UIImage(named: "omaha1") ?? UIImage())
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(backToHomePage))
        //self.navigationItem.leftBarButtonItem =
        
        switch PERMISSION {
        case Permission.OWNER:
            configurePageForOwner()
        case Permission.ADMIN:
            configurePageForAdmin()
        case Permission.MEMBER:
            configurePageForMember()
        default:
            configurePageForVisitor()
        }
    }
    
    func configurePageForOwner() {
        communityCover = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: UserSession.selectedCommunity?.name ?? "My Community", withMenuOptions: [])
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(openEditCommunity))]
        setupCommonLayout()
    }
    
    func configurePageForAdmin() {
        communityCover = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: UserSession.selectedCommunity?.name ?? "My Community", withMenuOptions: [])
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(openEditCommunity))]
        setupCommonLayout()
    }
    
    func configurePageForMember() {
        communityCover = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: UserSession.selectedCommunity?.name ?? "My Community", withMenuOptions: [])
        setupCommonLayout()
    }
    
    func configurePageForVisitor() {
        addUserToCommunityButton = RectangleButton(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 50), withText: "+ Add To My Communities")
        addUserToCommunityButton.addTarget(self, action: #selector(addUserToCommunity), for: .touchUpInside)

        communityCover = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: addUserToCommunityButton.frame.maxY, width: self.view.frame.width, height: 100), withTitle: UserSession.selectedCommunity?.name ?? "My Community", withMenuOptions: [])
        setupCommonLayout()
        
    }
    
    func setupCommonLayout() {
        divider = UIView(frame: CGRect(x: self.view.frame.minX, y: communityCover.frame.maxY, width: self.view.frame.width, height: 5))
        divider.backgroundColor = UIColor.darkGray
        
        postsTableTag = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: divider.frame.maxY, width: self.view.frame.width, height: 40), withLabel: "Community Feed")
        filterPostButton = ActionButton(x: self.view.frame.maxX - 50, y: postsTableTag.frame.minY + 5, icon: "filterIcon")
        filterPostButton.addTarget(self, action: #selector(openFilterPostsOptions), for: .touchUpInside)
        postsTable = PostsTableView(frame: CGRect(x: self.view.frame.minX, y: postsTableTag.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - postsTableTag.frame.maxY), posts: [], postSelectedCallback: { (post) in
            
        })
        
        self.view.addSubview(background)
        self.view.addSubview(communityCover)
        self.view.addSubview(divider)
        self.view.addSubview(postsTableTag)
        self.view.addSubview(postsTable)
        self.view.addSubview(filterPostButton)
        
        if (PERMISSION == Permission.OWNER || PERMISSION == Permission.ADMIN || (PERMISSION == Permission.MEMBER && (UserSession.selectedCommunity?.allowMembersToPostToFeed)!)) {
            addPostButton = ActionButton(x: filterPostButton.frame.minX - 50, y: postsTableTag.frame.minY + 5, icon: "addIcon")
            addPostButton.addTarget(self, action: #selector(addNewPost), for: .touchUpInside)
            self.view.addSubview(addPostButton)
        }
    }
    
    @objc func leaveCommunity(_ sender: Any) {
        
    }
    
    @objc func openEditCommunity(_ sender: Any) {
        
    }
    
    @objc func viewMembers(_ sender: Any) {
        
    }
    
    @objc func openFilterPostsOptions(_ sender: Any) {
        
    }
    
    @objc func addNewPost(_ sender: Any) {
        
    }
    
    func loadTrendingEvents() {
        //trendingEventsTable.reloadEvents(events: devStubs.getEventList())
    }
    
    func loadCommunityFeed() {
        postsTable.reloadPosts(posts: devStubs.getPostList())
    }
    
    func updateLayoutForPermissions() {
        setPermissions()
        if (PERMISSION == Permission.MEMBER) {
            if (addUserToCommunityButton != nil) {
                addUserToCommunityButton.isHidden = true
            }
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
