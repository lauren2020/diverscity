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
    var viewModel = CreateNewAccountViewModel()
    var activityHelper: ActivityHelper = ActivityHelper()
    
    var background: Background!
    var scrollView: UIScrollView!
    var titleView: TitleTextView!
    var backToWelcomePageButton: TextOnlyButton!
    var firstNameTextField: FormEntryField!
    var lastNameTextField: FormEntryField!
    var usernameTextField: FormEntryField!
    var passwordTextField: FormEntryField!
    var confirmPasswordTextField: FormEntryField!
    var emailTextField: FormEntryField!
    var confirmEmailTextField: FormEntryField!
    var zipcodeTextField: FormEntryField!
    var createUserButton: RectangleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.white
        background = Background(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height), withImage: UIImage(named: "divircityHome-1") ?? UIImage())
        background.blur(alpha: 0.8)
        
        scrollView = UIScrollView(frame: background.frame)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 600)
        
        titleView = TitleTextView(frame: CGRect(x: background.frame.minX + 40, y: background.frame.minY + 45, width: 300, height: 75), withTitle: "New Account")
        
        backToWelcomePageButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 70, y: self.view.frame.minX + 20, width: 50, height: 100), withText: "Cancel")
        backToWelcomePageButton.addTarget(self, action: #selector(goBackToHomePage), for: .touchUpInside)
        backToWelcomePageButton.setTitleColor(UIColor.black, for: .normal)
        
        setupFields()
        
        createUserButton = RectangleButton(frame: CGRect(x: background.frame.midX - 75, y: confirmPasswordTextField.frame.maxY + 50, width: 150, height: 50), withText: "Create Account")
        createUserButton.addTarget(self, action: #selector(createNewUser), for: .touchUpInside)
        
        addSubviews()
    }
    
    func setupFields() {
        let verticalGap: CGFloat = 45.0
        let leftGap: CGFloat = 30.0
        firstNameTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: titleView.frame.minY + 65, width: 300, height: 40), withHint: "First Name")
        lastNameTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: firstNameTextField.frame.minY + verticalGap, width: 300, height: 40), withHint: "Last Name")
        
        emailTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: lastNameTextField.frame.minY + verticalGap, width: 300, height: 40), withHint: "Email")
        confirmEmailTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: emailTextField.frame.minY + verticalGap, width: 300, height: 40), withHint: "Confirm Email")
        
        zipcodeTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: confirmEmailTextField.frame.minY + verticalGap, width: 300, height: 40), withHint: "Zipcode")
        
        usernameTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: zipcodeTextField.frame.minY + verticalGap, width: 300, height: 40), withHint: "Username")
        passwordTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: usernameTextField.frame.minY + verticalGap, width: 300, height: 40), withHint: "Password")
        confirmPasswordTextField = FormEntryField(frame: CGRect(x: self.view.frame.minX + leftGap, y: passwordTextField.frame.minY + verticalGap, width: 300, height: 40), withHint: "Confirm Password")
    }
    
    func addSubviews() {
        self.view.addSubview(background)
        self.view.addSubview(scrollView)
        scrollView.addSubview(titleView)
        scrollView.addSubview(backToWelcomePageButton)
        scrollView.addSubview(firstNameTextField)
        scrollView.addSubview(lastNameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(confirmEmailTextField)
        scrollView.addSubview(zipcodeTextField)
        scrollView.addSubview(usernameTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(confirmPasswordTextField)
        scrollView.addSubview(createUserButton)
    }
    
    func setupViewModel() {
        viewModel.startActivityEvent.addSubscriber {
            self.activityHelper.startActivity(view: self.view)
        }
        viewModel.stopActivityEvent.addSubscriber {
            self.activityHelper.stopActivity(view: self.view)
        }
        viewModel.newUserPostCompleteEvent.addSubscriber(subscriber: { (user) in
            self.performSegue(withIdentifier: "createAccountToMyHomePage", sender: (Any).self)
        })
        viewModel.emailsDontMatchEvent.addSubscriber {
            self.throwEmailsDontMatchError()
        }
        viewModel.passwordNotValidEvent.addSubscriber {
            self.throwPasswordDoesNotMeetRequirementsError()
        }
        viewModel.passwordsDontMatchEvent.addSubscriber {
            self.throwPasswordsDontMatchError()
        }
        viewModel.fieldCannotBeEmptyEvent.addSubscriber(subscriber: { (field) in
            self.throwEmptyFieldError(field: field)
        })
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
    }
    
    @objc func createNewUser(_ sender: Any) {
        viewModel.postNewUser(id: "1", username: usernameTextField.text, password: passwordTextField.text, passwordConfirm: confirmPasswordTextField.text, firstName: firstNameTextField.text, lastName: lastNameTextField.text, email: emailTextField.text, emailConfirm: confirmEmailTextField.text, zipcode: zipcodeTextField.text, privacyType: "0")
    }
    
    func resetFields() {
        passwordTextField.backgroundColor = UIColor.white
        confirmPasswordTextField.backgroundColor = UIColor.white
        
        emailTextField.backgroundColor = UIColor.white
        confirmEmailTextField.backgroundColor = UIColor.white
    }
    
    func throwPasswordsDontMatchError() {
        passwordTextField.backgroundColor = UIColor.red
        confirmPasswordTextField.backgroundColor = UIColor.red
    }
    
    func throwEmailsDontMatchError() {
        emailTextField.backgroundColor = UIColor.red
        confirmEmailTextField.backgroundColor = UIColor.red
    }
    
    func throwPasswordDoesNotMeetRequirementsError() {
        passwordTextField.backgroundColor = UIColor.red
        confirmPasswordTextField.backgroundColor = UIColor.red
    }
    
    func throwEmptyFieldError(field: String) {
        switch (field) {
            case "email" : emailTextField.backgroundColor = UIColor.red
        confirmEmailTextField.backgroundColor = UIColor.red
            case "password" : passwordTextField.backgroundColor = UIColor.red
        confirmPasswordTextField.backgroundColor = UIColor.red
            default: ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
