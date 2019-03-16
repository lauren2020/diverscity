//
//  EventDetailLocationItemView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/15/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventDetailLocationItemView: EventDetailItemView  {
    var locationTitle: UILabel!
    override init(frame: CGRect, event: CommunityEvent) {
        super.init(frame: frame, event: event)
        locationTitle = UILabel(frame: CGRect(x: self.frame.minX + 20, y: self.frame.midY - 15, width: 100, height: 30))
        locationTitle.text = "Location: "
        addSubview(locationTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
