//
//  TagsTableSelector.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/24/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class TagsTableSelector: UITableView {
    //var featuresList: [CommunityFeature]
    //Convert to list from API
    var tagsList:[Tag] = [Tag(id: 0, label: "Religious", colorCode: 0), Tag(id: 1, label: "Service", colorCode: 1),Tag(id: 2, label: "Education", colorCode: 2),Tag(id: 3, label: "Business", colorCode: 3),Tag(id: 4, label: "Leadership", colorCode: 4),Tag(id: 5, label: "Development", colorCode: 5),Tag(id: 6, label: "Enviorment", colorCode: 6),Tag(id: 7, label: "Health", colorCode: 7),Tag(id: 8, label: "Outreach", colorCode: 8),Tag(id: 9, label: "Athletics", colorCode: 9),Tag(id: 10, label: "Charity", colorCode: 0),Tag(id: 11, label: "Non-Profit", colorCode: 1)]
    
    var selectedTags: [String] = []
    
    //var onFeatureSelected: (_ event: CommunityFeature) -> () = {_ in }
    
    init(frame: CGRect) {
        let style: UITableViewStyle = UITableViewStyle.plain
        //onFeatureSelected = featureSelectedCallback
        //self.featuresList = featuresList
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(TagTableCell.self, forCellReuseIdentifier: "tagCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadTags(tags: [Tag]) {
        self.tagsList = tags
        self.reloadData()
    }
}

extension TagsTableSelector: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "tagCell") as! TagTableCell
        cell.textLabel?.text = tagsList[indexPath.row].label
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //onFeatureSelected(featuresList[indexPath.row])
        self.deselectRow(at: indexPath, animated: true)
        let cell = self.cellForRow(at: indexPath)
        if(cell?.backgroundColor == UIColor.blue) {
            tagsList[indexPath.row].selected = false
            cell?.backgroundColor = UIColor.white
        } else {
            tagsList[indexPath.row].selected = true
            cell?.backgroundColor = UIColor.blue
        }
        selectedTags = []
        for tag in tagsList {
            if (tag.selected == true) {
                selectedTags.append(String(tag.id))
            }
        }
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 250
    //    }
}
