//
//  CreateAccountViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Data type user has properties that are force unwrapped when intitialized, ensure usere enetered properties fill all force unwrapped property fields
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
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
           // UserSession.api.createNewUser(username: usernameTextField.text!, password: passwordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!)
            self.performSegue(withIdentifier: "createAccountToMyHomePage", sender: (Any).self)
        }
    }
    
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
