//
//  CreateAccountViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/12/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    var api = API()

    //Place first name outlet below here:
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackToHomePage(_ sender: Any) {
        performSegue(withIdentifier: "createAccountToWelcome", sender: (Any).self)
    }
    
    /******************************************************************/
    /*Challenge 2: Connect the create button to this code and make it create a new user with the information in the fields*/
    /******************************************************************/
    //Step 1: Connect the button to this code
        //A) Hold the control button and then click and hold on the "Create" button on the Create New Account screen. While still holding the control button and left mouse button, drag cursor over to this text. You will notice a blue line show up accross the text under your cursor. Whereever the blue line is when you release the mouse button is where the connection to the button will be placed in the code. Place the blue line below the line below that says "//Connect "Create" button below here:"
        //B) When you first let go of the mouse button, a box will pop up where you can specify details about the connection. Click on the drop down that says "Outlet" on it. When the drop down menu appears, select the "Action" option.
        //C) Next, in the text field labled "Name" give the action a name that describes what the action will do with NO spaces in the name, for example, you could name it "createNewUser".
        //D) Click "Connect"
    //Step 2: Connect the fields to this code that you need information from
        // Most of the fields are already connected for you, but the "First Name" field still needs to be connected.
        //A) Once again, hold control and click and hold on the text field next to "First Name", while still holding the control button and mouse button, drag the cursor to this text and drop it below where it says "Place first name outlet below here:" above.
        //B) When the details box pops up, this time leave "Outlet" as the selected option on the top drop down. Outlet means its a reference to the properties of the object not a responder to actions the user performs on the object.
        //C) In the field next to "Name", give the outlet a name that describes what it references with NO spaces, for example, you could name it "firstNameTextField"
        //D) Click "Connect"
    //Step 3: Check to make sure the fields are filled out correctly
        //A) First we need check that the text in the password field and the confirm password field are the same. To do this, we will use an whats called an "if statement". To write an if statement, inside of the brackets created by the action connection you made to the "Create" button in step 1, write: "if() {}". If statements work by checking a comparison statement we write inside the () and performing the code we place inside the {} only if what we write in the () is true. In this case, we want to compare the text in the password field and the text in the confirm password field. To write this, inside the () we just created for the if statement write "passwordTextField.text! != confirmPasswordTextField.text!"
            //"passwordTextField" and "confirmPasswordTextField" are the names of the 2 fields that hold the text we want to compare. The "." after each of these names tells swift we want to access a charachteristic of the fields that we will specify after the ".", since we want to access the text, after the "." we write "text", the "!" means "force unwrap" but dont worry about that right now. The "!=" in between "passwordTextField.text!" and "confirmPasswordTextField.text!" means "not equal, or if the texts are not the same, our if statment, will run the code in our {}
        //B) Above our if statement (but still inside our action {}) write the word "var", this tells swift you want to create a container to hold a piece of information. After var, type a space and then give our data container a name of "allFieldsComplete". After "allFieldsComplete", type a space and "= true", this puts the value of true inside our data container "allFieldsComplete"
        //C) Inside the {} of our if statement, copy this code:
            /*
                allFieldsComplete = false
                passwordTextField.backgroundColor = UIColor.red
                confirmPasswordTextField.backgroundColor = UIColor.red
            */
            // Here, we are putting false inside "allFieldsComplete" to indicate that there is an issue with the given input. The next 2 lines set the color of the 2 text fields to red to indicate to the user there is an issue.
        //D) Copy this code and put it below the if statement we jsut created to do the same check but on the email fields instead of the passwords.
            /*
                if(emailTextField.text! != confirmEmailTextField.text!) {
                    allFieldsComplete = false
                    emailTextField.backgroundColor = UIColor.red
                    confirmEmailTextField.backgroundColor = UIColor.red
                }
            */
        //E) Create a final if statement that checks if the "allFieldsComplete" container is holding true. To do this write the following code below the last if statemnt we created
            /*
                if(allFieldsComplete) {
                }
            */
    //Step 4: Create the user and send the user to their home page
        //A) Inside the "if(allFieldsComplete)" if statement {} we are going to tell our "API" to store our new users information in our database. A database is just a big container to hold and organize a bunch of information. The API is like a server in a resturaunt, the server takes an order from you, takes the order to the kitchen, and returns the food you requested. Similarly, the API takes a request from us to the database and brings back the information we asked for. In this case, were going to tell the api to store our new users information in the database. To do this we will first tell swift we are using our api which we named "api" by writing "api". After well use our "." to tell swift we want to access a specific charachteristic of our api, following the "." well write "createNewUser()". Inside the () we will write the information for the new user we want to create. This will end up looking like the following:
                /*
                    api.createNewUser(username: usernameTextField.text!, password: passwordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!)
                */
            //Copy the code above into the {} of the "if(allFieldsComplete)" if statement
    //B) Finnally, create a segue like we did in the first challenge in the same "if(allFieldsComplete)" if statement {}, the segue will look like this:
            /*
                performSegue(withIdentifier: "createAccountToMyHomePage", sender: (Any).self)
            */
    
    
    
    
    
    //Connect "Create" button below here:
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAccountToMyHomePage"
        {
            if let vc = segue.destination as? MyHomePageViewController
            {
                vc.api = self.api
            }
        }
        if segue.identifier == "createAccountToWelcome"
        {
            if let vc = segue.destination as? WelcomeViewController
            {
                vc.api = self.api
            }
        }
    }

}
