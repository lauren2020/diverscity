//
//  EventItemView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventItemView: UIView {
    var eventImage: UIImageView!
    var eventTitle: UILabel!
    var eventCategory: TagIndicator!
    var communityTitle: UILabel!
    var eventDate: UILabel!
    var eventTime: UILabel!
    var eventLocation: UILabel!
    
    init(x: CGFloat, y: CGFloat, width: CGFloat) {
        let frame = CGRect(x: x, y: y, width: width, height: 305)
        super.init(frame: frame)
        
        eventImage = UIImageView(frame: CGRect(x: x + 10, y: y + 10, width: width - 20, height: 150))
        eventCategory = TagIndicator(origin: CGPoint(x: width - 110, y: eventImage.frame.maxY + 10), text: "PARTY", color: UIColor.yellow)//UILabel(frame: CGRect(x: width - 110, y: eventImage.frame.maxY + 10, width: 100, height: 40))
        eventTitle = UILabel(frame: CGRect(x: x + 10, y: eventImage.frame.maxY + 10, width: width - 20 - eventCategory.frame.width, height: 40))
        eventTitle.font = UIFont(name: "Avenir-HeavyOblique", size: 20)
        
        communityTitle = UILabel(frame: CGRect(x: x, y: y + 30, width: 150, height: 20))
        communityTitle.backgroundColor = UIColor.gray
        
        eventDate = UILabel(frame: CGRect(x: x + 10, y: eventTitle.frame.maxY + 10, width: 110, height: 40))
        eventDate.attributedText = NSAttributedString(string: "Date")

        //let divider1 = UIView(frame: )
        eventTime = UILabel(frame: CGRect(x: eventDate.frame.maxX, y: eventTitle.frame.maxY + 10, width: 60, height: 40))
        eventTime.attributedText = NSAttributedString(string: "Time")
        //let divider2 = UIView(frame: )
        eventLocation = UILabel(frame: CGRect(x: eventTime.frame.maxX, y: eventTitle.frame.maxY + 10, width: (width / 3) + 10, height: 40))
        eventLocation.attributedText = NSAttributedString(string: "Location")
        
        self.addSubview(eventImage)
        self.addSubview(eventCategory)
        self.addSubview(eventTitle)
        self.addSubview(eventDate)
        self.addSubview(communityTitle)
        //self.addSubview(divider1)
        self.addSubview(eventTime)
        //self.addSubview(divider2)
        self.addSubview(eventLocation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadEvent(event: CommunityEvent) {
        eventImage.image = event.coverImage
        eventTitle.text = event.name
        eventCategory.text = event.category.label
        eventCategory.layer.backgroundColor = event.category.color.cgColor
        communityTitle.text = event.community.name
        eventDate.text = event.date?.toString()
        eventTime.text = event.startTime?.toTime()
        eventLocation.text = event.locationName
    }
}

extension Date {
    func toString() -> String {
        return self.description
    }
}

extension Double {
    func toString() -> String {
        return String(self)
    }
    
    func toTime() -> String {
        let hour = floor(self)
        let minute = Int((self - hour) * 60)
        let time = Int(hour).toString() + ":" + minute.toString()
        return time
    }
}

extension Int {
    func toString() -> String {
        return String(self)
    }
}
