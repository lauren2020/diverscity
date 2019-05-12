//
//  MyHomePageViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class MyHomePageViewController: BaseViewController {
    var viewModel = MyHomePageViewModel()
    var activityHelper = ActivityHelper()
    
    var divider: UIView!
    var background: Background!
    var cover: UserCover!
    var infoOptions: UserHeaderInformationView!
    var myCommunitiesTag: ObjectLabelTag!
    var reloadCommunitiesButton: RectangleButton!
    var communitiesTableView: CommunityTableView!
    var findCommunities: RectangleButton!
    var createCommunity: RectangleButton!
    var menuIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        setupViews()
        setupViewModel()
        viewModel.loadCommunities()
    }
    
    func setupViews() {
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutOfAccount))]
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(image: UIImage(named: "settingsIcon"), style: .plain, target: self, action: #selector(openUserSettings))]
        
        cover = UserCover(frame: CGRect(x: self.view.bounds.minX, y: self.view.bounds.minY, width: self.view.frame.width, height: 180), withTitle: (UserSession.user?.firstName)! + " " + (UserSession.user?.lastName)!, withMenuOptions: [])
        
        infoOptions = UserHeaderInformationView(frame: CGRect(x: self.view.frame.minX, y: cover.frame.maxY, width: self.view.frame.width, height: 50), name: "Info")
        infoOptions.eventsIcon.addTarget(self, action: #selector(openMyEvents), for: .touchUpInside)
        infoOptions.peopleIcon.addTarget(self, action: #selector(openMyConnections), for: .touchUpInside)
        infoOptions.notificationsIcon.addTarget(self, action: #selector(openMyNotifications), for: .touchUpInside)
        
        divider = UIView(frame: CGRect(x: self.view.frame.minX, y: infoOptions.frame.maxY, width: self.view.frame.width, height: 5))
        divider.backgroundColor = UIColor.darkGray
        
        background = Background(frame: self.view.frame, withImage: UIImage(named: "omaha1") ?? UIImage())
        
        myCommunitiesTag = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: divider.frame.maxY, width: self.view.frame.width, height: 40), withLabel: "My Communities")
        reloadCommunitiesButton = RectangleButton(frame: CGRect(x: self.view.frame.minX + 210, y: 0, width: 100, height: 40), withText: "Reload")
        reloadCommunitiesButton.addTarget(self, action: #selector(reloadCommunities), for: .touchUpInside)
        
        // TODO: y value for findCommunities and createCommunity should be - height (40) not 105, why is view maxy off screen?
        findCommunities = RectangleButton(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.maxY - 105, width: (self.view.frame.width / 2), height: 40), withText: "Find Communities")
        findCommunities.addTarget(self, action: #selector(goToFindCommunities), for: .touchUpInside)
        
        createCommunity = RectangleButton(frame: CGRect(x: self.view.frame.maxX - (self.view.frame.width / 2), y: self.view.frame.maxY - 105, width: (self.view.frame.width / 2), height: 40), withText: "Create Community")
        createCommunity.addTarget(self, action: #selector(createNewCommunity), for: .touchUpInside)
        
        communitiesTableView = CommunityTableView(frame: CGRect(x: self.view.frame.minX, y: myCommunitiesTag.frame.maxY, width: self.view.frame.width, height: findCommunities.frame.minY - myCommunitiesTag.frame.maxY), communities: [], communitySelectedCallback: { (community) in
                UserSession.selectedCommunity = community
                let communityTabsViewController = CommunityTabsViewController()
                self.present(communityTabsViewController, animated: true, completion: nil)
            })
        
        self.view.addSubview(background)
        self.view.addSubview(background)
        self.view.addSubview(cover)
        self.view.addSubview(infoOptions)
        self.view.addSubview(divider)
        self.view.addSubview(myCommunitiesTag)
        self.view.addSubview(communitiesTableView)
        self.view.addSubview(findCommunities)
        self.view.addSubview(createCommunity)
    }
    
    func setupViewModel() {
        viewModel.loadCommunitiesEvent.addSubscriber(subscriber: onUpdateCommunityList)
        viewModel.loadMyNotifiationsEvent.addSubscriber(subscriber: { (notifications) in
            self.infoOptions.notificationsIcon.setTagCount(count: notifications.count)
        })
        viewModel.startActivityEvent.addSubscriber {_ in
            self.activityHelper.startActivity(view: self.view)
        }
        viewModel.stopActivityEvent.addSubscriber {_ in
            self.activityHelper.stopActivity(view: self.view)
        }
    }
    
    func onUpdateCommunityList(newCommunities: [Community]) {
        self.communitiesTableView.reloadCommunities(communities: newCommunities)
    }
    
    @objc func openMyEvents() {
        let myEventsListViewController = MyEventsListViewController()
        self.navigationController?.pushViewController(myEventsListViewController, animated: true)
    }
    
    @objc func openMyConnections() {
        let myConnectionsListViewController = MyConnectionsListViewController()
        self.navigationController?.pushViewController(myConnectionsListViewController, animated: true)
    }
    
    @objc func openMyNotifications() {
        let myNotificationsListViewController = MyNotificationsListViewController()
        self.navigationController?.pushViewController(myNotificationsListViewController, animated: true)
    }
    
    @objc func reloadCommunities(_ sender: Any) {
        viewModel.loadCommunities()
    }
    
    @objc func openUserSettings(_ sender: Any) {
        let userSettingsViewController = UserSettingsViewController()
        self.navigationController?.pushViewController(userSettingsViewController, animated: true)
    }
    
    @objc func createNewCommunity(_ sender: Any) {
        let createNewCommunityPageViewController = CreateNewCommunityViewController()
    self.navigationController?.pushViewController(createNewCommunityPageViewController, animated: true)
        self.present(createNewCommunityPageViewController, animated: true, completion: nil)
    }
    
    @objc func goToFindCommunities(_ sender: Any) {
        let newCommunitiesTabsViewController = NewCommunitiesTabsViewController()
        self.present(newCommunitiesTabsViewController, animated: true, completion: nil)
    }
    
    @objc func logoutOfAccount(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
