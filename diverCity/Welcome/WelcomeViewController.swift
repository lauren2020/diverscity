//
//  WelcomeViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/11/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //check for known location image
    }
    
    @IBAction func goToSignInPage(_ sender: Any) {
        performSegue(withIdentifier: "welcomeToSignIn", sender: (Any).self)
    }
    
    @IBAction func goToCreateAccountPage(_ sender: Any) {
        //self.performSegue(withIdentifier: "welcomeToCreateAccount", sender: (Any).self)
    }
    
    @IBAction func showPrivacyPolicy(_ sender: Any) {
    }
    
    @IBAction func showFAQs(_ sender: Any) {
        //UserSession.api.getUsers()
        //UserSession.api.getUserAccountInformation(username: "lshultz", password: "@Qaz102938")
        
//        Community.communityInfo(withId: "1") {
//            (results:[Community]) in
//            //print("Results: ", results)
//            for result in results {
//                print("result: ", result)
//            }
//        }
    }
    
    @IBAction func showAbout(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "welcomeToSignIn"
//        {
//            if let vc = segue.destination as? SignInViewController
//            {
//            }
//        }
//        if segue.identifier == "welcomeToCreateAccount"
//        {
//            if let vc = segue.destination as? CreateAccountViewController
//            {
//            }
//        }
    }

}
