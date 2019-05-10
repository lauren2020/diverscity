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
    var viewModel = EventDetailsViewModel()
    
    var eventCover: EventCover!
    var eventDetailsTable: EventDetailsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Event"
        setupViewModel()
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = UIColor.white
        
        eventCover = EventCover(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 300), coverPhoto: viewModel.event?.coverImage ?? UIImage(), eventTitle: viewModel.event?.name ?? "")
        
        (viewModel.event != nil) ? eventDetailsTable = EventDetailsTableView(frame: CGRect(x: self.view.frame.minX, y: eventCover.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - eventCover.frame.maxY), detailsList: [EventDetailType.DATE, EventDetailType.LOCATION, EventDetailType.DETAILS, EventDetailType.ATTENDANCE], event: viewModel.event!, detailSelectedCallback: { (detail) in
                // TODO: Execute event detail action
            }) : nil
        
        self.view.addSubview(eventCover)
        (viewModel.event != nil) ? self.view.addSubview(eventDetailsTable) : nil
    }
    
    func setupViewModel() {
        
    }
}
