//
//  CommunityTableCell.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/7/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class CommunityTableCell: UITableViewCell {
    var communityView: CommunityItemView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        communityView = CommunityItemView(x: self.contentView.frame.minX, y: self.contentView.frame.minY, width: self.contentView.frame.width)
        
        self.contentView.addSubview(communityView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
