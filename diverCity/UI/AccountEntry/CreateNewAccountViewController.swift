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
    
    var backToWelcomePageButton: TextOnlyButton!
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
        setupViews()
        // Do any additional setup after loading the view.
        // Data type user has properties that are force unwrapped when intitialized, ensure usere enetered properties fill all force unwrapped property fields
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.gray
        backToWelcomePageButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 70, y: self.view.frame.minX + 20, width: 50, height: 100), withText: "Back")
        backToWelcomePageButton.addTarget(self, action: #selector(goBackToHomePage), for: .touchUpInside)
        self.view.addSubview(backToWelcomePageButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func goBackToHomePage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "createAccountToWelcome", sender: (Any).self)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}
