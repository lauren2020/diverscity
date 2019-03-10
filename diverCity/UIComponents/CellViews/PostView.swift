//
//  PostView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class PostView: UIView {
    var titleView: UILabel!
    var postBody: UILabel!
    var mediaHolder: MediaCollectionView?
    
    init(x: CGFloat, y: CGFloat, width: CGFloat) {
        let frame = CGRect(x: x, y: y, width: width, height: 305)
        super.init(frame: frame)
        
        self.titleView = UILabel(frame: CGRect(x: self.frame.minX + 5, y: self.frame.minY + 5, width: self.frame.width - 10, height: 40))
        //self.titleView.text = post.title
        
        self.postBody = UILabel(frame: CGRect(x: self.frame.minX + 5, y: self.titleView.frame.maxY + 5, width: self.frame.width - 10, height: 100))
        self.postBody.numberOfLines = 5
//        /self.postBody.text = post.body
        
        self.addSubview(titleView)
        self.addSubview(postBody)
        
//        if (post.media.count != 0) {
//            self.mediaHolder = MediaCollectionView(frame: CGRect(x: self.frame.minX, y: self.postBody.frame.maxY + 5, width: self.frame.width - 10, height: 150), mediaList: post.media, mediaSelectedCallback: { (media) in
//
//                })
//            self.addSubview(titleView)
//            self.addSubview(postBody)
//            self.addSubview(mediaHolder)
//        } else {
//            self.addSubview(titleView)
//            self.addSubview(postBody)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadPost(post: Post) {
        self.titleView.text = post.title
        self.postBody.text = post.body
    }
}
