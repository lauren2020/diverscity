//
//  UsersTableView.swift
//  diverCity
//
//  Created by Lauren Shultz on 4/12/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class UsersTableView: UITableView {
    var itemsList: [User]
    var onUserSelected: (_ user: User) -> () = {_ in }
    
    init(frame: CGRect, usersList: [User], userSelectedCallback: @escaping (_ user: User) -> ()) {
        let style: UITableViewStyle = UITableViewStyle.plain
        onUserSelected = userSelectedCallback
        self.itemsList = usersList
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(UserTableCell.self, forCellReuseIdentifier: "userCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadEvents(users: [User]) {
        self.itemsList = users
        self.reloadData()
    }
}

extension UsersTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onUserSelected(itemsList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
