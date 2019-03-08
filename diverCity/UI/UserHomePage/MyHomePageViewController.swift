//
//  MyHomePageViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class MyHomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var divider: UIView!
    var scrollView: UIScrollView!
    var background: Background!
    var menuButton: MenuIconButton!
    var logoutButton: MenuItemButton!
    var headerName: UILabel!
    
    var myCommunitiesTag: ObjectLabelTag!
    var reloadCommunitiesButton: RectangleButton!
    var myCommunitiesTableList: UITableView!
    
    var findCommunities: RectangleButton!
    var createCommunity: RectangleButton!
    
    var myEventsTag: ObjectLabelTag!
    var myEventsTableList: UITableView!
    
    var menuIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

        // Do any additional setup after loading the view.
        //||||||||ActivityHelper.startActivity(view: self.view)
        UserSession.user?.communities = []
        for communityId in (UserSession.user?.communityIds)! {
            //Community.communityInfo(withId: String(communityId), completion: setCommunities)
            //ActivityHelper.startActivity(view: self.view)
            let getCommunityRequest = APIDelegate.requestBuilder(withPath: APIDelegate.communitiesPath, withId: String(communityId), methodType: "GET", postContent: nil)
            if (getCommunityRequest != nil) {
                APIDelegate.performTask(withRequest: getCommunityRequest!, completion: {json in
                    //|||||||||ActivityHelper.stopActivity(view: self.view)
                    if (json != nil && json?.count != 0) {
                        do {
                            UserSession.user?.communities.append(try Community(json: json![0])!)
                            self.myCommunitiesTableList.reloadData()
                        } catch {
                            print(error)
                        }
                    }
                })
            } else {
                //|||||||||ActivityHelper.stopActivity(view: self.view)
            }
        }
        closeMenu()
        headerName.text = "| " + (UserSession.user?.firstName)! + " " + (UserSession.user?.lastName)!
        myCommunitiesTableList.delegate = self
        myCommunitiesTableList.dataSource = self
    }
    
    func setupViews() {
        divider = UIView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY + 145, width: self.view.frame.width, height: 5))
        divider.backgroundColor = UIColor.darkGray
        
        scrollView = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY + 150, width: self.view.frame.width, height: self.view.frame.height - divider.frame.maxY))
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1050)
        
        background = Background(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        background.setupBackground(forView: self.view, withImage: UIImage(named: "omaha1") ?? UIImage())
        menuButton = MenuIconButton(frame: CGRect(x: self.view.frame.maxX - 55, y: self.view.frame.minY + 40, width: 50, height: 50))
        menuButton.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        logoutButton = MenuItemButton(frame: CGRect(x: self.view.frame.maxX - 100, y: menuButton.frame.maxY + 20, width: 100, height: 40), withTaskName: "Logout")
        logoutButton.addTarget(self, action: #selector(logoutOfAccount), for: .touchUpInside)
        headerName = UILabel(frame: CGRect(x: self.view.frame.minX + 10, y: self.view.frame.minY + 30, width: 400, height: 100))
        headerName.font = UIFont(name: "HelveticaNeue-Bold", size: 36)
        ////////////////////////////////////
        myCommunitiesTag = ObjectLabelTag(frame: CGRect(x: scrollView.frame.minX, y: 0, width: 200, height: 40), withLabel: "My Communities")
        reloadCommunitiesButton = RectangleButton(frame: CGRect(x: scrollView.frame.minX + 210, y: 0, width: 100, height: 40), withText: "Reload")
        reloadCommunitiesButton.addTarget(self, action: #selector(reloadCommunities), for: .touchUpInside)
        myCommunitiesTableList = UITableView(frame: CGRect(x: scrollView.frame.minX, y: 40, width: scrollView.frame.width, height: 400))
        myCommunitiesTableList.register(CommunityTableCell.self, forCellReuseIdentifier: "cell")
        
        findCommunities = RectangleButton(frame: CGRect(x: scrollView.frame.minX, y: myCommunitiesTableList.frame.maxY, width: (self.view.frame.width / 2), height: 40), withText: "Find Communities")
        findCommunities.addTarget(self, action: #selector(goToFindCommunities), for: .touchUpInside)
        createCommunity = RectangleButton(frame: CGRect(x: scrollView.frame.maxX - (self.view.frame.width / 2), y: myCommunitiesTableList.frame.maxY, width: (self.view.frame.width / 2), height: 40), withText: "Create Community")
        createCommunity.addTarget(self, action: #selector(createNewCommunity), for: .touchUpInside)
        
        myEventsTag = ObjectLabelTag(frame: CGRect(x: scrollView.frame.minX, y: findCommunities.frame.maxY, width: 200, height: 40), withLabel: "My Events")
        myEventsTableList = UITableView(frame: CGRect(x: scrollView.frame.minX, y: myEventsTag.frame.maxY, width: scrollView.frame.width, height: 400))
        myEventsTableList.register(EventTableCell.self, forCellReuseIdentifier: "eventCell")
        
        self.view.addSubview(background)
        self.view.addSubview(divider)
        self.view.addSubview(scrollView)
        self.view.addSubview(menuButton)
        self.view.addSubview(logoutButton)
        self.view.addSubview(headerName)
        scrollView.addSubview(myCommunitiesTag)
        scrollView.addSubview(reloadCommunitiesButton)
        scrollView.addSubview(myCommunitiesTableList)
        scrollView.addSubview(findCommunities)
        scrollView.addSubview(createCommunity)
        scrollView.addSubview(myEventsTag)
        scrollView.addSubview(myEventsTableList)
    }
    
//    func setCommunities(newCommunity: Community?) {
//        if (newCommunity != nil) {
//            UserSession.user?.communities.append(newCommunity!)
//        } else {
//            print("Failed to retrieve community!")
//        }
//    }
    
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
        let communityTabsViewController = CommunityTabsViewController()
        self.present(communityTabsViewController, animated: true, completion: nil)
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
        print(UserSession.user?.communities)
        myCommunitiesTableList.reloadData()
    }
    
    @objc func createNewCommunity(_ sender: Any) {
        let createNewCommunityPageViewController = CreateNewCommunityViewController()
        self.present(createNewCommunityPageViewController, animated: true, completion: nil)
    }
    
    @objc func goToFindCommunities(_ sender: Any) {
        let newCommunitiesTabsViewController = NewCommunitiesTabsViewController()
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
