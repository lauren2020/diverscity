//
//  FirstViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/10/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "| " + (UserSession.selectedCommunity?.name)!
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func returnToMyHomePage(_ sender: Any) {
        performSegue(withIdentifier: "communityHomePageToMyHomePage", sender: (Any).self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

