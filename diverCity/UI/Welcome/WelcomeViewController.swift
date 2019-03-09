//
//  WelcomeViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/11/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var background: Background!
    var titleView: UITextView!
    var signInButton: RectangleButton!
    var createAccountButton: RectangleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //check for known location image
        setupViews()
    }
    
    func setupViews() {
        background = Background(frame: self.view.bounds)
        background.setupBackground(forView: self.view, withImage: UIImage(named: "omaha1") ?? UIImage())
        
        titleView = UITextView(frame: CGRect(x: background.bounds.midX - 150, y: background.bounds.minY + 100, width: 300, height: 100))
        titleView.text = "divirCITY"
        titleView.backgroundColor = UIColor.init(white: 1, alpha: 0)
        titleView.textAlignment = NSTextAlignment.center
        titleView.font = UIFont(name: "HelveticaNeue-Bold", size: 48)
        
        signInButton = RectangleButton(frame: CGRect(x: background.bounds.midX - 75, y: background.bounds.midY - 10, width: 150, height: 40), withText: "Sign In")
        signInButton.addTarget(self, action: #selector(goToSignInPage), for: .touchUpInside)
        
        createAccountButton = RectangleButton(frame: CGRect(x: background.bounds.midX - 75, y: signInButton.bounds.maxY + 20, width: 150, height: 40), withText: "Create Account")
        createAccountButton.addTarget(self, action: #selector(goToCreateAccountPage), for: .touchUpInside)
        
        background.addSubview(titleView)
        background.addSubview(signInButton)
        background.addSubview(createAccountButton)
    }
    
    @objc func goToSignInPage(_ sender: Any) {
        let signInViewController = SignInViewController()
        present(signInViewController, animated: true, completion: nil)
    }
    
    @objc func goToCreateAccountPage(_ sender: Any) {
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
