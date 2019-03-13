//
//  EventDetailsViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/12/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventDetailsViewController: BaseNavigationItemViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Event"
        
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.white
    }
}
