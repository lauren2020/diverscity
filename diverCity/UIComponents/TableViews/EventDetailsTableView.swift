//
//  EventDetailsTableView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/15/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventDetailsTableView: UITableView {
    var event: CommunityEvent!
    var itemsList: [EventDetailType]
    var onDetailSelected: (_ detail: EventDetailType) -> () = {_ in }
    
    init(frame: CGRect, detailsList: [EventDetailType], event: CommunityEvent, detailSelectedCallback: @escaping (_ detail: EventDetailType) -> ()) {
        let style: UITableViewStyle = UITableViewStyle.plain
        onDetailSelected = detailSelectedCallback
        self.itemsList = detailsList
        self.event = event
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(EventDetailsTableCell.self, forCellReuseIdentifier: "eventDetailCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadEvents(details: [EventDetailType]) {
        self.itemsList = details
        self.reloadData()
    }
}

extension EventDetailsTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "eventDetailCell", for: indexPath) as! EventDetailsTableCell
        cell.setDetail(event: event, type: itemsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onDetailSelected(itemsList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

