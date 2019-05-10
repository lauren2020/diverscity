//
//  WelcomeViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/11/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {
    //var donateBar
    
    var background: Background!
    var titleView: UITextView!
    var signInButton: RectangleButton!
    var createAccountButton: RectangleButton!
    
    var aboutDivircityButton: TextOnlyButton!
    
    var privacyPolicyButon: TextOnlyButton!
    var contactUsButton: TextOnlyButton!
    var faqButton: TextOnlyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //check for known location image
        setupViews()
    }
    
    func setupViews() {
        background = Background(frame: self.view.frame, withImage: UIImage(named: "divircityHome") ?? UIImage())
        background.imageView.contentMode = UIView.ContentMode.scaleAspectFill
        //background.imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        titleView = UITextView(frame: CGRect(x: background.frame.midX - 150, y: background.frame.minY + 100, width: 300, height: 100))
        titleView.text = ""//divirCITY"
        titleView.backgroundColor = UIColor.init(white: 1, alpha: 0)
        titleView.textAlignment = NSTextAlignment.center
        titleView.font = UIFont(name: "HelveticaNeue-Bold", size: 48)
        
        setupCenterAlignedButtons()
        setupBottomAlignedButtons()
        
        addSubviews()
    }
    
    func setupCenterAlignedButtons() {
        signInButton = RectangleButton(frame: CGRect(x: background.frame.midX - 75, y: background.frame.midY - 10, width: 150, height: 40), withText: "Sign In")
        signInButton.addTarget(self, action: #selector(goToSignInPage), for: .touchUpInside)
        
        createAccountButton = RectangleButton(frame: CGRect(x: background.frame.midX - 75, y: signInButton.frame.maxY + 20, width: 150, height: 40), withText: "Create Account")
        createAccountButton.addTarget(self, action: #selector(goToCreateAccountPage), for: .touchUpInside)
        
        aboutDivircityButton = TextOnlyButton(frame: CGRect(x: self.view.frame.midX - 100, y: createAccountButton.frame.maxY + 30, width: 200, height: 40), withText: "What is divirCITY?")
        aboutDivircityButton.addTarget(self, action: #selector(showAbout), for: .touchUpInside)
        aboutDivircityButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    func setupBottomAlignedButtons() {
        privacyPolicyButon = TextOnlyButton(frame: CGRect(x: self.view.frame.minX + 24, y: self.view.frame.maxY - 100, width: (self.view.frame.width / 3) - 32, height: 40), withText: "Privacy Policy")
        privacyPolicyButon.addTarget(self, action: #selector(showPrivacyPolicy), for: .touchUpInside)
        privacyPolicyButon.setTitleColor(UIColor.black, for: .normal)
        
        faqButton = TextOnlyButton(frame: CGRect(x: privacyPolicyButon.frame.maxX + 24, y: self.view.frame.maxY - 100, width: (self.view.frame.width / 3) - 32, height: 40), withText: "FAQs")
        faqButton.addTarget(self, action: #selector(showFAQs), for: .touchUpInside)
        faqButton.setTitleColor(UIColor.black, for: .normal)
        
        contactUsButton = TextOnlyButton(frame: CGRect(x: faqButton.frame.maxX, y: self.view.frame.maxY - 100, width: (self.view.frame.width / 3) - 32, height: 40), withText: "Contact Us")
        contactUsButton.addTarget(self, action: #selector(showContactUsPage), for: .touchUpInside)
        contactUsButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    func addSubviews() {
        self.view.addSubview(background)
        background.addSubview(titleView)
        background.addSubview(signInButton)
        background.addSubview(createAccountButton)
        background.addSubview(aboutDivircityButton)
        background.addSubview(privacyPolicyButon)
        background.addSubview(faqButton)
        background.addSubview(contactUsButton)
    }
    
    @objc func goToSignInPage(_ sender: Any) {
        let signInViewController = SignInViewController()
        present(signInViewController, animated: true, completion: nil)
    }
    
    @objc func goToCreateAccountPage(_ sender: Any) {
        let createNewAccountViewController = CreateNewAccountViewController()
        present(createNewAccountViewController, animated: true, completion: nil)
    }
    
    @objc func showPrivacyPolicy(_ sender: Any) {
        let privacyPolicyViewController = PrivacyPolicyViewController()
        present(privacyPolicyViewController, animated: true, completion: nil)
    }
    
    @objc func showFAQs(_ sender: Any) {
        let fAQViewController = FAQViewController()
        present(fAQViewController, animated: true, completion: nil)
    }
    
    @objc func showContactUsPage(_ sender: Any) {
        let contactUsViewController = ContactUsViewController()
        present(contactUsViewController, animated: true, completion: nil)
    }
    
    @objc func showAbout(_ sender: Any) {
        let aboutDivircityViewController = AboutDivircityViewController()
        present(aboutDivircityViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
