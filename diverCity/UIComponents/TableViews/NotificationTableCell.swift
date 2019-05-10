//
//  NotificationTableCell.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class NotificationTableCell: UITableViewCell {
    var notificationItemView: NotificationItemView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        notificationItemView = NotificationItemView(x: self.contentView.frame.minX, y: self.contentView.frame.minY, width: self.contentView.frame.width)
        
        self.contentView.addSubview(notificationItemView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
