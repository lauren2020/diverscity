//
//  MediaCollectionView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class MediaCollectionView: UICollectionView {
    var mediaList: [Media]
    var onMediaSelected: (_ media: Media) -> () = {_ in }
    
    init(frame: CGRect, mediaList: [Media], mediaSelectedCallback: @escaping (_ media: Media) -> ()) {
        print("Collection Media: ", mediaList)
        let layout: UICollectionViewLayout = UICollectionViewLayout()
        onMediaSelected = mediaSelectedCallback
        self.mediaList = mediaList
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor.gray
        self.register(MediaCollectionTile.self, forCellWithReuseIdentifier: "mediaCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadEvents(media: [Media]) {
        self.mediaList = media
        self.reloadData()
    }
}

extension MediaCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Collections Count: ", mediaList.count)
        return mediaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Loading TIle: ", mediaList[indexPath.row])
        let cell = (self.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! MediaCollectionTile)
        cell.imageHolder.image = mediaList[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onMediaSelected(mediaList[indexPath.row])
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
