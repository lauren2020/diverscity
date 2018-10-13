//
//  SignInViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/11/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var user: User?
    var api = API()

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackToWelcomePage(_ sender: Any) {
        self.performSegue(withIdentifier: "signInToWelcome", sender: (Any).self)
    }
    
    @IBAction func signInToUserAccount(_ sender: Any) {
        user = api.getUserAccountInformation(username: usernameTextField.text!, password: passwordTextField.text!)
        if(user?.userName != nil) {
            self.performSegue(withIdentifier: "signInToMyHomePage", sender: (Any).self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signInToWelcome"
        {
            if let vc = segue.destination as? WelcomeViewController
            {
                vc.api = self.api
            }
        }
    }

}
