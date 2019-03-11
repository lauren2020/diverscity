//
//  CreateNewAccountViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class CreateNewAccountViewController: BaseViewController {
    
    var firstNameTextField: UITextField!
    var lastNameTextField: UITextField!
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var confirmPasswordTextField: UITextField!
    var emailTextField: UITextField!
    var confirmEmailTextField: UITextField!
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Data type user has properties that are force unwrapped when intitialized, ensure usere enetered properties fill all force unwrapped property fields
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func goBackToHomePage(_ sender: Any) {
        performSegue(withIdentifier: "createAccountToWelcome", sender: (Any).self)
    }
    
    @IBAction func createNewUser(_ sender: Any) {
        var allFieldsComplete = true
        if(passwordTextField.text! != confirmPasswordTextField.text!) {
            allFieldsComplete = false
            passwordTextField.backgroundColor = UIColor.red
            confirmPasswordTextField.backgroundColor = UIColor.red
        } else {
            passwordTextField.backgroundColor = UIColor.white
            confirmPasswordTextField.backgroundColor = UIColor.white
        }
        
        if(emailTextField.text! != confirmEmailTextField.text!) {
            allFieldsComplete = false
            emailTextField.backgroundColor = UIColor.red
            confirmEmailTextField.backgroundColor = UIColor.red
        } else {
            emailTextField.backgroundColor = UIColor.white
            confirmEmailTextField.backgroundColor = UIColor.white
        }
        
        if(allFieldsComplete) {
            var body = ["username=" + usernameTextField.text!]
            body.append("password=" + passwordTextField.text!)
            body.append("firstname=" + firstNameTextField.text!)
            body.append("lastname=" + lastNameTextField.text!)
            body.append("email=" + emailTextField.text!)
            body.append("communities=")
            body.append("friends=")
            body.append("zipcode=68007")
            body.append("privacy_type=0")
            //startActivity()
            //User.createNew(body: body, completion: userCreated)
            ActivityHelper.startActivity(view: self.view)
            let getUserRequest = APIDelegate.requestBuilder(withPath: APIDelegate.usersPath, withId: usernameTextField.text!, methodType: "POST", postContent: APIDelegate.buildPostString(body: body))
            if (getUserRequest != nil) {
                APIDelegate.performTask(withRequest: getUserRequest!, completion: {json in
                    ActivityHelper.stopActivity(view: self.view)
                    if (json != nil && json?.count != 0) {
                        do {
                            print("User created successfully!")
                            UserSession.user = try User(json: json![0])
                            self.performSegue(withIdentifier: "createAccountToMyHomePage", sender: (Any).self)
                        } catch {
                            print(error)
                        }
                    }
                })
            }
        }
    }
    
    //    /*
    //     * FUNCTION: startActivity
    //     * PURPOSE: Shows the activity indicator and stops recording user touches.
    //     */
    //    func startActivity()
    //    {
    //        print("Activity Started")
    //        self.view.alpha = 0.5
    //        activityIndicator.center = self.view.center
    //        activityIndicator.hidesWhenStopped = true
    //        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    //        self.view.addSubview(activityIndicator)
    //        activityIndicator.startAnimating()
    //        UIApplication.shared.beginIgnoringInteractionEvents()
    //    }
    //    /*
    //     * FUNCTION: stopActivity
    //     * PURPOSE: Hides the activity indicator and resumes responding to user touches
    //     */
    //    func stopActivity()
    //    {
    //        print("Activity Stopped")
    //        self.view.alpha = 1
    //        activityIndicator.stopAnimating()
    //        UIApplication.shared.endIgnoringInteractionEvents()
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == "createAccountToMyHomePage"
        //        {
        //            if let vc = segue.destination as? MyHomePageViewController
        //            {
        //            }
        //        }
        //        if segue.identifier == "createAccountToWelcome"
        //        {
        //            if let vc = segue.destination as? WelcomeViewController
        //            {
        //            }
        //        }
    }
    
}
