//
//  EventsCollectionView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class EventsCollectionView: UICollectionView {
    var eventsList: [CommunityEvent]
    var onEventSelected: (_ event: CommunityEvent) -> () = {_ in }
    
    init(frame: CGRect, eventsList: [CommunityEvent], eventSelectedCallback: @escaping (_ event: CommunityEvent) -> ()) {
        print("Collection Events: ", eventsList)
        let layout: UICollectionViewLayout = UICollectionViewLayout()
        onEventSelected = eventSelectedCallback
        self.eventsList = eventsList
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.gray
        self.register(EventCollectionTile.self, forCellWithReuseIdentifier: "eventCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadEvents(events: [CommunityEvent]) {
        self.eventsList = events
        self.reloadData()
    }
}

extension EventsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Collections Count: ", eventsList.count)
        return eventsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Loading TIle: ", eventsList[indexPath.row])
        let cell = (self.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionTile)
        cell.textLabel.text = eventsList[indexPath.row].name

//        cell.contentView.backgroundColor = UIColor.yellow
//        let titleView = UILabel(frame: CGRect(x: cell.contentView.frame.minX, y: cell.contentView.frame.minY, width: cell.contentView.frame.width, height: 40))
//        titleView.text = eventsList[indexPath.row].name
//        cell.contentView.addSubview(titleView)
//        cell.sizeToFit()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onEventSelected(eventsList[indexPath.row])
    }
    
    /////////////////////
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 16, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
}
