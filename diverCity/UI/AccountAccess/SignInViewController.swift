//
//  SignInViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/11/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    var usernameTextField: FormEntryField!
    var passwordTextField: FormEntryField!
    var signInButton: RectangleButton!
    var forgotYourPasswordButton: TextOnlyButton!
    var signInEntryBackground: UIView!
    var privacyPolicyButton: TextOnlyButton!
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
        background.setupBackground(forView: self.view, withImage: UIImage())
    }
    
    @IBAction func goBackToWelcomePage(_ sender: Any) {
        self.performSegue(withIdentifier: "signInToWelcome", sender: (Any).self)
    }
    
    @IBAction func signInToUserAccount(_ sender: Any) {
        ActivityHelper.startActivity(view: self.view)
        let getUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: usernameTextField.text!, methodType: "GET", postContent: nil)
        if (getUserRequest != nil) {
            APIDelegate.performTask(withRequest: getUserRequest!, completion: {json in
                ActivityHelper.stopActivity(view: self.view)
                if (json != nil && json?.count != 0) {
                    do {
                        UserSession.user = try User(json: json![0])
                        self.performSegue(withIdentifier: "signInToMyHomePage", sender: (Any).self)
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
