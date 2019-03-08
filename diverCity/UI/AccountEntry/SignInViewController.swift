//
//  SignInViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    var titleView: UITextView!
    var usernameTextField: FormEntryField!
    var passwordTextField: FormEntryField!
    var signInButton: RectangleButton!
    var forgotYourPasswordButton: TextOnlyButton!
    var signInEntryBackground: UIView!
    //var privacyPolicyButton: TextOnlyButton!
    var background: Background!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupViews() {
        background = Background(frame: self.view.bounds)
        background.setupBackground(forView: self.view, withImage: UIImage(named: "omaha1") ?? UIImage())
//        signInEntryBackground = UIView(frame: CGRect(x: 30, y: 150, width: self.view.bounds.width - 60, height: self.view.bounds.height - 300))
//        signInEntryBackground.backgroundColor = UIColor.gray
        titleView = UITextView(frame: CGRect(x: self.view.bounds.midX - 150, y: self.view.bounds.minY + 100, width: 300, height: 100))
        titleView.text = "Sign In"
        titleView.backgroundColor = UIColor.init(white: 1, alpha: 0)
        titleView.textAlignment = NSTextAlignment.center
        titleView.font = UIFont(name: "HelveticaNeue-Bold", size: 48)
        
        usernameTextField = FormEntryField(frame: CGRect(x: self.view.bounds.minX + 60, y: self.view.bounds.midY - 100, width: 300, height: 40), withHint: "Username")
        //usernameTextField.setupTextField(withHint: "Username", frame: usernameTextField.bounds)
        
        passwordTextField = FormEntryField(frame: CGRect(x: self.view.bounds.minX + 60, y: self.view.bounds.midY - 60, width: 300, height: 40), withHint: "Password")
        //passwordTextField.setupTextField(withHint: "Password", frame: passwordTextField.bounds)
        
        signInButton = RectangleButton(frame: CGRect(x: usernameTextField.bounds.minX + (self.view.bounds.width / 2), y: passwordTextField.bounds.maxY + 20 + (self.view.bounds.height / 2), width: 0, height: 0), withText: "Sign In")
        //signInButton.setupButton(withText: "Sign In", frame: signInButton.bounds)
        signInButton.addTarget(self, action: #selector(signInToUserAccount), for: .touchUpInside)
        
        forgotYourPasswordButton = TextOnlyButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        forgotYourPasswordButton.setupButton(withText: "Forgot your password?", atX: signInButton.bounds.minX, atY: signInButton.bounds.maxY + 20)
        
        //self.view.addSubview(signInEntryBackground)
        self.view.addSubview(titleView)
        self.view.addSubview(usernameTextField)
        self.view.bringSubview(toFront: usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.bringSubview(toFront: passwordTextField)
        self.view.addSubview(signInButton)
        self.view.bringSubview(toFront: signInButton)
        self.view.addSubview(forgotYourPasswordButton)
    }
    
    @objc func goBackToWelcomePage(_ sender: Any) {
        let welcomeViewController = WelcomeViewController()
        self.present(welcomeViewController, animated: true, completion: nil)
        //self.performSegue(withIdentifier: "signInToWelcome", sender: (Any).self)
    }
    
    @objc func signInToUserAccount(_ sender: Any) {
        ActivityHelper.startActivity(view: self.view)
        let getUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: usernameTextField.text!, methodType: "GET", postContent: nil)
        if (getUserRequest != nil) {
            APIDelegate.performTask(withRequest: getUserRequest!, completion: {json in
                ActivityHelper.stopActivity(view: self.view)
                if (json != nil && json?.count != 0) {
                    do {
                        UserSession.user = try User(json: json![0])
                        let homePageViewController = MyHomePageViewController()
                        self.present(homePageViewController, animated: true, completion: nil)
                        //self.performSegue(withIdentifier: "signInToMyHomePage", sender: (Any).self)
                    } catch {
                        print(error)
                    }
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == "signInToWelcome"
        //        {
        //            if let vc = segue.destination as? WelcomeViewController
        //            {
        //            }
        //        }
    }
    
}
