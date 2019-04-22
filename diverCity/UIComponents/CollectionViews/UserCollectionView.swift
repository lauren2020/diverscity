//
//  UserCollectionView.swift
//  diverCity
//
//  Created by Lauren Shultz on 4/12/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class UsersCollectionView: UICollectionView {
    var usersList: [User]
    var onUserSelected: (_ user: User) -> () = {_ in }
    
    init(frame: CGRect, usersList: [User], userSelectedCallback: @escaping (_ user: User) -> ()) {
        let layout: UICollectionViewLayout = UICollectionViewLayout()
        onUserSelected = userSelectedCallback
        self.usersList = usersList
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.gray
        self.register(UserCollectionTile.self, forCellWithReuseIdentifier: "userCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UsersCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onUserSelected(usersList[indexPath.row])
    }
}
