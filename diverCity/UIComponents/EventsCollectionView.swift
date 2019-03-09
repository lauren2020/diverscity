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
        let layout: UICollectionViewLayout = UICollectionViewLayout()
        onEventSelected = eventSelectedCallback
        self.eventsList = eventsList
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = UIColor.gray
        self.register(EventCollectionTile.self, forCellWithReuseIdentifier: "eventCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onEventSelected(eventsList[indexPath.row])
    }
}
