//
//  MyEventsListViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/6/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MyEventsListViewController: BaseViewController {
    var viewModel = MyEventsListViewModel()
    var activityHelper = ActivityHelper()
    
    var myEventsTag: ObjectLabelTag!
    var myEventsTableView: EventsTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Event"
        self.view.backgroundColor = UIColor.white
        setupViews()
        viewModel.loadMyEventsList()
    }
    
    func setupViews() {
        myEventsTag = ObjectLabelTag(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 40), withLabel: "My Events")
        myEventsTableView = EventsTableView(frame: CGRect(x: self.view.frame.minX, y: myEventsTag.frame.maxY, width: self.view.frame.width, height: 550), eventsList: [], eventSelectedCallback: { (event) in
            let eventDetailsViewController = EventDetailsViewController()
            eventDetailsViewController.viewModel.event = event
            self.navigationController?.pushViewController(eventDetailsViewController, animated: true)
        })
        
        self.view.addSubview(myEventsTag)
        self.view.addSubview(myEventsTableView)
    }
    
    func setupViewModel() {
        viewModel.loadEventsEvent.addSubscriber(subscriber: onUpdateEvents)
        viewModel.startActivityEvent.addSubscriber {
            self.activityHelper.startActivity(view: self.view)
        }
        viewModel.stopActivityEvent.addSubscriber {
            self.activityHelper.stopActivity(view: self.view)
        }
    }
    
    func onUpdateEvents(newEvents: [CommunityEvent]) {
        self.myEventsTableView.reloadEvents(events: newEvents)
    }
}
