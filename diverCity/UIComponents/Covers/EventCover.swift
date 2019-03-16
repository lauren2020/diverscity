//
//  EventCover.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/15/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventCover: UIView {
    var coverPhotoHolder: UIImageView!
    var eventTitleBanner: UILabel!
    var divider: Divider!
    
    init(frame: CGRect, coverPhoto: UIImage, eventTitle: String) {
        super.init(frame: frame)
        
        coverPhotoHolder = UIImageView(frame: frame)
        coverPhotoHolder.image = coverPhoto
        
        eventTitleBanner = UILabel(frame: CGRect(x: frame.minX, y: frame.maxY - 70, width: (frame.width)*0.7, height: 50))
        eventTitleBanner.font = UIFont(name: "Avenir-HeavyOblique", size: 20)
        eventTitleBanner.adjustsFontSizeToFitWidth = true
        eventTitleBanner.backgroundColor = UIColor.gray
        eventTitleBanner.text = eventTitle
        
        divider = Divider(origin: CGPoint(x: frame.minX, y: frame.maxY + 2), width: frame.width)
        
        self.addSubview(coverPhotoHolder)
        self.addSubview(eventTitleBanner)
        self.addSubview(divider)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
