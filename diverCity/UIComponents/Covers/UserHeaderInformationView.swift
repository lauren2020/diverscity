//
//  UserHeaderInformationView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class UserHeaderInformationView: UIView {
    var notificationsIcon: UIButton!
    var settingsIcon: UIButton!
    var manageCommunitiesIcon: UIButton!
    init(frame: CGRect, name: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        
        //var 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
