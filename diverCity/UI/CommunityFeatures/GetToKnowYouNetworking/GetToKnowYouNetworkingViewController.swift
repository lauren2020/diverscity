//
//  GetToKnowYouNetworkingViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class GetToKNowYouNetworkingViewController: BaseTabViewController {
    var header: CommunityHeader!
    var backButton: MenuItemButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GTYK Networking"
        self.view.backgroundColor = UIColor.gray
        setupViews()
    }
    
    func setupViews() {
        backButton = MenuItemButton(frame: CGRect(x: 0, y: 0, width: 150, height: 30), withTaskName: "Back")
        header = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: "Get To Know You", withMenuOptions: [backButton])
        
        self.view.addSubview(header)
    }
}
