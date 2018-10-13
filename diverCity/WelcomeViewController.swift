//
//  WelcomeViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/11/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var api = API()

    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //check for known location image
    }
    
    @IBAction func goToSignInPage(_ sender: Any) {
        /************************************************************************/
        /*Challenge: Send User to Sign In page when "Sign In" Button is clicked */
        /************************************************************************/
        //Step 1: Create a "segue"
        // Background: The term "segue" comes from a term used in movies and music that means to "move without interruption from one song, melody, or scene to another"
                // In our app, we can picture each screen as a scene, a "segue" in our develpment of this app is an uninterrupted move from one screen to another screen
                // In this case, we want to create a line that move from the "welcome" screen to the "sign in" screen
            //A) Find the welcome screen first and look at the bar above the screen that has 3 yellow and orange icons. Hold the control button and left mouse click and hold the circle yellow icon with a white square in the middle, while still holding the down the mouse button and control button, drag the cursur to the middle of the "Sign In" screen and release the mouse button and the control button.
            //B) When the menu appears, click the top option which says "show"
            //C) Click on the segue (The line that appears connecting the 2 screens). The right side panel will bring up options for editing our newly created segue. Find the text field at the top of the right panel that says "Identifier". In this field, give the segue a name of "welcomeToSignIn"(the name should NOT contain spaces and should be descriptive of what it does). Remember the name we gave it for the next section.
        //Step 2: Perform the segue
            //A) tell swift you want to perform a segue by simply writing "performSegue" (write commands below the line that says "Write commands below this line:")
            //B) you probably noticed that Xcode offered you a list of potential commands it thought you might be typing, if you clicked the auto-complete for performSegue, you noticed it added "(withIdentifier: <#T##String#>, sender: <#T##Any?#>)" after the word performSegue. When () come after a command, we are providing swift with more information about what we want the command to do. In this case, swift needs to know which screen the segue is taking us to and who is authorized to tell us to go there. If you didnt click the autocomplete, go ahead and write "(withIdentifier: <#T##String#>, sender: <#T##Any?#>)" after "performSegue"
            //C) Right now, inside our () are two words with grey boxes around them. These are place holders that tell us what type of information we need to replace it with. In this case, the placeholders say "String" and "Any". When we want to tell swift we are giving it letters (and not say, writing command or giving it a number) we write the letters inside of "". Where it says "String", write some "" to tell it were giving it letters and then inside the quotes, we will write the name of the segue we want swift to use to take us to the next screen. Inside the "", write the same name identifier you gave the segue we created above (It needs to be exactly the same to work). Where the "Any" placeholder is, replace it with the word "(Any).self" but do NOT write quotes around this one. By writing Any, we are telling swift that any kind of action that triggers this segue is acceptable.
        //Step 3: Try it out! See if your button works now by using the emulator.
        
        //Write commands below this line:
        performSegue(withIdentifier: "welcomeToSignIn", sender: (Any).self)
    }
    
    @IBAction func goToCreateAccountPage(_ sender: Any) {
        /************************************************************************/
        /*Challenge: Send User to Create Account page when "Create Account" Button is clicked */
        /************************************************************************/
        // See if you can do this one on your own! If you get stuck feel free to ask questions :)
        self.performSegue(withIdentifier: "welcomeToCreateAccount", sender: (Any).self)
    }
    
    @IBAction func showPrivacyPolicy(_ sender: Any) {
    }
    
    @IBAction func showFAQs(_ sender: Any) {
    }
    
    @IBAction func showAbout(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "welcomeToSignIn"
        {
            if let vc = segue.destination as? SignInViewController
            {
                vc.api = self.api
            }
        }
        if segue.identifier == "welcomeToCreateAccount"
        {
            if let vc = segue.destination as? CreateAccountViewController
            {
                vc.api = self.api
            }
        }
    }

}
