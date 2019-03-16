//
//  EventDetailsViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/12/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventDetailsViewController: BaseViewController {
    var event: CommunityEvent?
    var eventCover: EventCover!
    var eventDetailsTable: EventDetailsTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Event"
        
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.white
        
        eventCover = EventCover(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 300), coverPhoto: event?.coverImage ?? UIImage(), eventTitle: event?.name ?? "")
        
        (event != nil) ? eventDetailsTable = EventDetailsTableView(frame: CGRect(x: self.view.frame.minX, y: eventCover.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - eventCover.frame.maxY), detailsList: [EventDetailType.DATE, EventDetailType.LOCATION, EventDetailType.DETAILS, EventDetailType.ATTENDANCE], event: event!, detailSelectedCallback: { (detail) in
            
            }) : nil
        
        self.view.addSubview(eventCover)
        (event != nil) ? self.view.addSubview(eventDetailsTable) : nil
    }
}
