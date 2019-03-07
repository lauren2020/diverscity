//
//  CommunityHomeViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/15/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CommunityHomeViewController: UIViewController {

    @IBOutlet weak var backToHomeButton: UIButton!
    @IBOutlet weak var communityTitle: UILabel!
    @IBOutlet weak var addUserToCommunityButton: UIButton!
    
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

        // Do any additional setup after loading the view.
        communityTitle.text = UserSession.selectedCommunity?.name
        updateLayoutForPermissions()
        closeMenu()
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
    
    @IBAction func addUserToCommunity(_ sender: Any) {
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
            let newCommunities = (UserSession.user?.communityIds.joined(separator: ","))! == "" ? (community?.id) : (UserSession.user?.communityIds.joined(separator: ","))! + "," + (community?.id)!
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
    
    @IBAction func toggleMenu(_ sender: Any) {
        if(menuIsOpen) {
            closeMenu()
        } else {
            openMenu()
        }
    }
    
    func openMenu() {
        backToHomeButton.isHidden = false
    }
    
    func closeMenu() {
        backToHomeButton.isHidden = true
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
