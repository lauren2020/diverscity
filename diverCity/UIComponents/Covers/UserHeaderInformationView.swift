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
    var notificationsIcon: TaggedButton!
    var peopleIcon: ActionButton!
    var eventsIcon: ActionButton!
//    var settingsIcon: UIButton!
//    var manageCommunitiesIcon: UIButton!
    
    init(frame: CGRect, name: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        
        notificationsIcon = TaggedButton(frame: CGRect(x: self.frame.width - 100, y: (self.frame.height / 2) - 15, width: 30, height: 30), icon: UIImage(named: "notificationBell") ?? UIImage())
            //ActionButton(x: frame.maxX - 60, y: frame.midY - 15, icon: "notificationsIcon")
        
        peopleIcon = ActionButton(x: (self.frame.width / 2) - 15, y: notificationsIcon.frame.minY, icon: "peopleIcon")
        
        eventsIcon = ActionButton(x: 70, y: peopleIcon.frame.minY, icon: "eventsIcon")
        
        self.addSubview(notificationsIcon)
        self.addSubview(peopleIcon)
        self.addSubview(eventsIcon)
        bringSubview(toFront: notificationsIcon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
