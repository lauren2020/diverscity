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
    var viewModel = SignInViewModel()
    var activityHelper = ActivityHelper()
    
    var titleView: UITextView!
    var usernameTextField: FormEntryField!
    var passwordTextField: FormEntryField!
    var signInButton: RectangleButton!
    var forgotYourPasswordButton: TextOnlyButton!
    var signInEntryBackground: UIView!
    var backToWelcomePageButton: TextOnlyButton!
    var background: Background!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupViews() {
        background = Background(frame: self.view.frame, withImage: UIImage(named: "divircityHome-1") ?? UIImage())
        background.blur(alpha: 0.8)
        
        titleView = UITextView(frame: CGRect(x: self.view.frame.midX - 150, y: self.view.frame.minY + 100, width: 300, height: 100))
        titleView.text = "Sign In"
        titleView.backgroundColor = UIColor.init(white: 1, alpha: 0)
        titleView.textAlignment = NSTextAlignment.center
        titleView.font = UIFont(name: "HelveticaNeue-Bold", size: 48)
        
        backToWelcomePageButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 70, y: self.view.frame.minX + 20, width: 50, height: 100), withText: "Back")
        backToWelcomePageButton.addTarget(self, action: #selector(goBackToWelcomePage), for: .touchUpInside)
        backToWelcomePageButton.setTitleColor(UIColor.black, for: .normal)
        
        usernameTextField = FormEntryField(frame: CGRect(x: self.view.frame.midX - 150, y: self.view.frame.midY - 100, width: 300, height: 40), withHint: "Username")
        
        passwordTextField = FormEntryField(frame: CGRect(x: self.view.frame.midX - 150, y: usernameTextField.frame.maxY, width: 300, height: 40), withHint: "Password")
        
        signInButton = RectangleButton(frame: CGRect(x: self.view.frame.midX - 75, y: passwordTextField.frame.maxY + 20, width: 150, height: 40), withText: "Sign In")
        signInButton.addTarget(self, action: #selector(signInToUserAccount), for: .touchUpInside)
        
        forgotYourPasswordButton = TextOnlyButton(frame: CGRect(x: self.view.frame.midX - 100, y: signInButton.frame.maxY + 30, width: 200, height: 40), withText: "Forgot your password?")
        forgotYourPasswordButton.addTarget(self, action: #selector(showForgotYourPasswordPage), for: .touchUpInside)
        forgotYourPasswordButton.setTitleColor(UIColor.black, for: .normal)
        
        addSubviews()
    }
    
    func addSubviews() {
        self.view.addSubview(background)
        self.view.addSubview(backToWelcomePageButton)
        self.view.addSubview(titleView)
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(signInButton)
        self.view.bringSubview(toFront: signInButton)
        self.view.addSubview(forgotYourPasswordButton)
    }
    
    func setupViewModel() {
        viewModel.startActivityEvent.addSubscriber {
            self.activityHelper.startActivity(view: self.view)
        }
        viewModel.stopActivityEvent.addSubscriber {
            self.activityHelper.stopActivity(view: self.view)
        }
        viewModel.onSignInComplete.addSubscriber(subscriber: { (user) in
            let userSessionNavigationController = UserSessionNavigationController()
            self.present(userSessionNavigationController, animated: true, completion: nil)
        })
    }
    
    @objc func goBackToWelcomePage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func showForgotYourPasswordPage(_ sender: Any) {
        let forgotYourPasswordViewController = ForgotYourPasswordViewController()
        present(forgotYourPasswordViewController, animated: true, completion: nil)
    }
    
    @objc func signInToUserAccount(_ sender: Any) {
        viewModel.sendSignInRequest(id: usernameTextField.text!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}
