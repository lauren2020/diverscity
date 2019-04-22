//
//  UserTableCell.swift
//  diverCity
//
//  Created by Lauren Shultz on 4/12/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class UserTableCell: UITableViewCell {
    var userItemView: EventItemView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userItemView = EventItemView(x: self.contentView.frame.minX, y: self.contentView.frame.minY, width: self.contentView.frame.width)
        
        self.contentView.addSubview(userItemView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


