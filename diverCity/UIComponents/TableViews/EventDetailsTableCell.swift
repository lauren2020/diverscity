//
//  EventDetailsTableCell.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/15/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventDetailsTableCell: UITableViewCell {
    var detailItemView: EventDetailItemView?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
//    func setDate(event: CommunityEvent) {
//        detailItemView = EventDetailDateItemView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), event: event)
//        self.addSubview(detailItemView!)
//    }
    
    func setDetail(event: CommunityEvent, type: EventDetailType) {
        switch type {
        case EventDetailType.DATE:
            detailItemView = EventDetailDateItemView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), event: event)
        case EventDetailType.ATTENDANCE:
            detailItemView = EventDetailAttendanceItemView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), event: event)
        case EventDetailType.DETAILS:
            detailItemView = EventDetailInfoItemView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), event: event)
        case EventDetailType.LOCATION:
            detailItemView = EventDetailLocationItemView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), event: event)
        case EventDetailType.REPEATING_INFO:
            detailItemView = EventDetailDateItemView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height), event: event)
        }
        
        (detailItemView != nil) ? self.addSubview(detailItemView!) : nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
