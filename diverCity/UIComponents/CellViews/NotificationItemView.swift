//
//  NotificationItemView.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class NotificationItemView: UIView {
    var iconHolder: UIImageView!
    var alert: UILabel!
    var readIndicator: UIImageView!
    
    init(x: CGFloat, y: CGFloat, width: CGFloat) {
        let frame = CGRect(x: x, y: y, width: width, height: 100)
        super.init(frame: frame)
        
        self.iconHolder = UIImageView(frame: CGRect(x: x + 10, y: y + 10, width: 80, height: 80))
        
        self.alert = UILabel(frame: CGRect(x: self.iconHolder.frame.maxX + 5, y: y + 45, width: self.frame.width - 10, height: 100))
        self.alert.numberOfLines = 2
    
        self.readIndicator = UIImageView(frame: CGRect(x: x + width - 10, y: y + 45, width: 10, height: 10))
        
        self.addSubview(iconHolder)
        self.addSubview(alert)
        self.addSubview(readIndicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadPost(notification: Notification) {
        self.alert.text = notification.alert
        self.iconHolder.image = getIcon(notification: notification)
        self.readIndicator.isHidden = notification.read
    }
    
    func getIcon(notification: Notification) -> UIImage? {
        switch notification.type {
            case 1: return notification.image
            default: return UIImage(named: "")
        }
    }
}
