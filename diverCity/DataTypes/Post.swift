//
//  Post.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var id: String
    var title: String
    var body: String
    var media: [Media]
    var comments: [Int]
    var sharedBy: [Int]
    var likedBy: [Int]
    var postDate: Date
    var user: User?
    var community: Community
    
    init(id: String, title: String, body: String, media: [Media], comments: [Int], sharedBy: [Int], likedBy: [Int], postDate: Date, user: User?, community: Community) {
        self.id = id
        self.title = title
        self.body = body
        self.media = media
        self.comments = comments
        self.sharedBy = sharedBy
        self.likedBy = likedBy
        self.postDate = postDate
        self.user = user
        self.community = community
    }
}
