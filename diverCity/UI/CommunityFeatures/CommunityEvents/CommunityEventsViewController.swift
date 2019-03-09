//
//  CommunityEventsViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 10/15/18.
//  Copyright © 2018 Lauren Shultz. All rights reserved.
//

import UIKit

class CommunityEventsViewController: BaseTabViewController {
    
    var header: CommunityHeader!
    var recomendedEventsCollectionView: EventsCollectionView!
    var eventSearchBar: UISearchBar!
    var eventsTable: EventsTableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Events"
        setupViews()
    }
    
    func setupViews() {
        header = CommunityHeader(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: 100), withTitle: UserSession.selectedCommunity?.name ?? "Community Events", withMenuOptions: [])
        
        var eventJson: [String:Any] = [:]
        eventJson.updateValue("Paper Pancake Feed", forKey: "name")
        eventJson.updateValue(false, forKey: "recurring")
        eventJson.updateValue(1143025200, forKey: "date")
        eventJson.updateValue(13.5, forKey: "start_time")
        eventJson.updateValue(14.5, forKey: "end_time")
        eventJson.updateValue("3", forKey: "going")
        eventJson.updateValue("2", forKey: "interestd")
        eventJson.updateValue("1", forKey: "not_going")
        var events: [CommunityEvent] = []
        do {
            events.append(try CommunityEvent(json: eventJson)!)
        } catch {
            print(error)
        }
        
        recomendedEventsCollectionView = EventsCollectionView(frame: CGRect(x: self.view.frame.minX, y: header.frame.maxY, width: self.view.frame.width, height: 200), eventsList: events, eventSelectedCallback: { event in
            
        })
        
        eventSearchBar = UISearchBar(frame: CGRect(x: self.view.frame.minX, y: recomendedEventsCollectionView.frame.maxY, width: self.view.frame.width, height: 50))
        eventsTable = EventsTableView(frame: CGRect(x: self.view.frame.minX, y: eventSearchBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - eventSearchBar.frame.maxY), eventsList: events, eventSelectedCallback: {event in
            
        })
        
        print("Events: ", events)
        self.view.addSubview(header)
        //self.view.addSubview(titleView)
        self.view.addSubview(recomendedEventsCollectionView)
        self.view.addSubview(eventSearchBar)
        self.view.addSubview(eventsTable)
        
        eventsTable.reloadData()
        recomendedEventsCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
