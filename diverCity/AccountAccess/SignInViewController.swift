//
//  SignInViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/11/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var un = ""
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func goBackToWelcomePage(_ sender: Any) {
        self.performSegue(withIdentifier: "signInToWelcome", sender: (Any).self)
    }
    
    @IBAction func signInToUserAccount(_ sender: Any) {
        startActivity()
        un = usernameTextField.text!
        User.all(withId: "all", completion: onAllUsersRecieved)
        //User.accountInfo(withId: usernameTextField.text!, completion: onUserRecieved)
    }
    
    func onAllUsersRecieved(users: [User]?) {
        stopActivity()
        if (users != nil) {
            for user in users! {
                if (user.userName == un) {
                    print("User found!")
                    UserSession.user = user
                    self.performSegue(withIdentifier: "signInToMyHomePage", sender: (Any).self)
                }
            }
        } else {
            print("There was an error retrieving users.")
        }
        
    }
    
    func onUserRecieved(user: User?) {
        stopActivity()
        if(user != nil) {
            print("Success!")
            UserSession.user = user
            self.performSegue(withIdentifier: "signInToMyHomePage", sender: (Any).self)
        } else {
            print("Failed to retrieve user!")
        }
    }
    
    /*
     * FUNCTION: startActivity
     * PURPOSE: Shows the activity indicator and stops recording user touches.
     */
    func startActivity()
    {
        print("Activity Started")
        self.view.alpha = 0.5
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    /*
     * FUNCTION: stopActivity
     * PURPOSE: Hides the activity indicator and resumes responding to user touches
     */
    func stopActivity()
    {
        print("Activity Stopped")
        self.view.alpha = 1
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
