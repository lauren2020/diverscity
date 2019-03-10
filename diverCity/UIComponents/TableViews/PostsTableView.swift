//
//  PostsTableView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class PostsTableView: UITableView {
    var posts: [Post]
    var onPostSelected: (_ post: Post) -> () = {_ in }
    
    init(frame: CGRect, posts: [Post], postSelectedCallback: @escaping (_ post: Post) -> ()) {
        let style: UITableViewStyle = UITableViewStyle.plain
        onPostSelected = postSelectedCallback
        self.posts = posts
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(PostTableCell.self, forCellReuseIdentifier: "postCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadPosts(posts: [Post]) {
        self.posts = posts
        self.reloadData()
    }
}

extension PostsTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "postCell") as! PostTableCell
        cell.postView.loadPost(post: posts[indexPath.row])
        //cell?.textLabel?.text = posts[indexPath.row].title
        //cell?.detailTextLabel?.text = posts[indexPath.row].body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onPostSelected(posts[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 305
    }
}
