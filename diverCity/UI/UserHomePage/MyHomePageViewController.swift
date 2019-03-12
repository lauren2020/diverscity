//
//  MyHomePageViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class MyHomePageViewController: BaseNavigationItemViewController {
    var divider: UIView!
    
    //Consider converting to table view
    var scrollView: UIScrollView!
    
    var background: Background!
    //var menuButton: MenuIconButton!
    var logoutButton: MenuItemButton!
    //var headerName: UILabel!
    var cover: UserCover!
    var infoOptions: UserHeaderInformationView!
    
    var myCommunitiesTag: ObjectLabelTag!
    var reloadCommunitiesButton: RectangleButton!
    var communitiesTableView: CommunityTableView!
    
    var findCommunities: RectangleButton!
    var createCommunity: RectangleButton!
    
    var myEventsTag: ObjectLabelTag!
    var myEventsTableView: EventsTableView!
    
    var menuIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        setupViews()
        loadCommunities()
        loadMyEventsList()
        
       //closeMenu()
        //headerName.text = "| " + (UserSession.user?.firstName)! + " " + (UserSession.user?.lastName)!
       
    }
    
    func setupViews() {
        cover = UserCover(frame: CGRect(x: self.view.bounds.minX, y: self.view.bounds.minY, width: self.view.frame.width, height: 150), withTitle: (UserSession.user?.firstName)! + " " + (UserSession.user?.lastName)!, withMenuOptions: [])
        infoOptions = UserHeaderInformationView(frame: CGRect(x: self.view.frame.minX, y: cover.frame.maxY, width: self.view.frame.width, height: 100), name: "Info")
        
        divider = UIView(frame: CGRect(x: self.view.frame.minX, y: infoOptions.frame.maxY, width: self.view.frame.width, height: 5))
        divider.backgroundColor = UIColor.darkGray
        
        scrollView = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: divider.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - divider.frame.maxY))
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1050)
        
        background = Background(frame: self.view.frame, withImage: UIImage(named: "omaha1") ?? UIImage())
        
        //menuButton = MenuIconButton(frame: CGRect(x: self.view.frame.maxX - 55, y: self.view.frame.minY + 40, width: 50, height: 50))
        //menuButton.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        //logoutButton = MenuItemButton(frame: CGRect(x: self.view.frame.maxX - 100, y: menuButton.frame.maxY + 20, width: 100, height: 40), withTaskName: "Logout")
        //logoutButton.addTarget(self, action: #selector(logoutOfAccount), for: .touchUpInside)
        //headerName = UILabel(frame: CGRect(x: self.view.frame.minX + 10, y: self.view.frame.minY + 30, width: 400, height: 100))
        //headerName.font = UIFont(name: "HelveticaNeue-Bold", size: 36)
        ////////////////////////////////////
        myCommunitiesTag = ObjectLabelTag(frame: CGRect(x: scrollView.frame.minX, y: 0, width: 200, height: 40), withLabel: "My Communities")
        reloadCommunitiesButton = RectangleButton(frame: CGRect(x: scrollView.frame.minX + 210, y: 0, width: 100, height: 40), withText: "Reload")
        reloadCommunitiesButton.addTarget(self, action: #selector(reloadCommunities), for: .touchUpInside)
        
        communitiesTableView = CommunityTableView(frame: CGRect(x: scrollView.frame.minX, y: myCommunitiesTag.frame.maxY, width: scrollView.frame.width, height: 400), communities: [], communitySelectedCallback: { (community) in
                UserSession.selectedCommunity = community
                let communityTabsViewController = CommunityTabsViewController()
            communityTabsViewController.rootNavigationController = self.navigationController
            print("Navigation Controller: ", communityTabsViewController.rootNavigationController)
            //self.navigationController?.pushViewController(communityTabsViewController, animated: true)
                self.present(communityTabsViewController, animated: true, completion: nil)
            })
        
        findCommunities = RectangleButton(frame: CGRect(x: scrollView.frame.minX, y: communitiesTableView.frame.maxY, width: (self.view.frame.width / 2), height: 40), withText: "Find Communities")
        findCommunities.addTarget(self, action: #selector(goToFindCommunities), for: .touchUpInside)
        
        createCommunity = RectangleButton(frame: CGRect(x: scrollView.frame.maxX - (self.view.frame.width / 2), y: communitiesTableView.frame.maxY, width: (self.view.frame.width / 2), height: 40), withText: "Create Community")
        createCommunity.addTarget(self, action: #selector(createNewCommunity), for: .touchUpInside)
        
        myEventsTag = ObjectLabelTag(frame: CGRect(x: scrollView.frame.minX, y: findCommunities.frame.maxY, width: 200, height: 40), withLabel: "My Events")
        //myEventsTableList = UITableView(frame: CGRect(x: scrollView.frame.minX, y: myEventsTag.frame.maxY, width: scrollView.frame.width, height: 400))
        //myEventsTableList.register(EventTableCell.self, forCellReuseIdentifier: "eventCell")
        myEventsTableView = EventsTableView(frame: CGRect(x: scrollView.frame.minX, y: myEventsTag.frame.maxY, width: scrollView.frame.width, height: 550), eventsList: [], eventSelectedCallback: { (event) in
            
            })
        
        self.view.addSubview(background)
        self.view.addSubview(background)
        self.view.addSubview(cover)
        self.view.addSubview(infoOptions)
        self.view.addSubview(divider)
        self.view.addSubview(scrollView)
        //self.view.addSubview(menuButton)
        //self.view.addSubview(logoutButton)
        //self.view.addSubview(headerName)
        scrollView.addSubview(myCommunitiesTag)
        scrollView.addSubview(reloadCommunitiesButton)
        scrollView.addSubview(communitiesTableView)
        scrollView.addSubview(findCommunities)
        scrollView.addSubview(createCommunity)
        scrollView.addSubview(myEventsTag)
        scrollView.addSubview(myEventsTableView)
    }
    
    @objc func toggleMenu(_ sender: Any) {
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
    
    @objc func reloadCommunities(_ sender: Any) {
        loadCommunities()
    }
    
    func loadCommunities() {
        var newCommunities: [Community] = []
        var numberOfCommunitiesToLoad = 0
        if ((UserSession.user?.communities)!.count <= UserSession.defaultLoadCountCommunities) {
            numberOfCommunitiesToLoad = (UserSession.user?.communities)!.count - 1
        } else {
            numberOfCommunitiesToLoad = UserSession.defaultLoadCountCommunities
        }
        if (numberOfCommunitiesToLoad > 0) {
        for index in 0...numberOfCommunitiesToLoad {
            //Community.communityInfo(withId: String(communityId), completion: setCommunities)
            //ActivityHelper.startActivity(view: self.view)
            let getCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String((UserSession.user?.communities)![index]), methodType: "GET", postContent: nil)
            if (getCommunityRequest != nil) {
                APIDelegate.performTask(withRequest: getCommunityRequest!, completion: {json in
                    if (json != nil && json?.count != 0) {
                        do {
                            newCommunities.append(try Community(json: json![0])!)
                            self.communitiesTableView.reloadCommunities(communities: newCommunities)
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
    
    func loadMyEventsList() {
        let devStubs = DevStubs()
        myEventsTableView.reloadEvents(events: devStubs.getEventList())
    }
    
    @objc func createNewCommunity(_ sender: Any) {
        let createNewCommunityPageViewController = CreateNewCommunityViewController()
        self.present(createNewCommunityPageViewController, animated: true, completion: nil)
    }
    
    @objc func goToFindCommunities(_ sender: Any) {
        let newCommunitiesTabsViewController = NewCommunitiesTabsViewController()
        //self.navigationController?.pushViewController(newCommunitiesTabsViewController, animated: true)
        self.present(newCommunitiesTabsViewController, animated: true, completion: nil)
    }
    
    @objc func logoutOfAccount(_ sender: Any) {
        let welcomeViewController = WelcomeViewController()
        self.present(welcomeViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
