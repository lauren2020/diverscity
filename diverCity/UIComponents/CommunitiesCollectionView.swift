//
//  CommunitiesCollectionView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class CommunitiesCollectionView: UICollectionView {
    var communitiesList: [Community]
    var onCommunitySelected: (_ community: Community) -> () = {_ in }
    
    init(frame: CGRect, communitiesList: [Community], communitySelectedCallback: @escaping (_ community: Community) -> ()) {
        let layout: UICollectionViewLayout = UICollectionViewLayout()
        onCommunitySelected = communitySelectedCallback
        self.communitiesList = communitiesList
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = UIColor.gray
        self.register(CommunityCollectionTile.self, forCellWithReuseIdentifier: "communityCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommunitiesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return communitiesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "communityCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCommunitySelected(communitiesList[indexPath.row])
    }
}
