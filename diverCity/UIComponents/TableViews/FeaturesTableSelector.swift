//
//  FeaturesTableSelector.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class FeaturesTableSelector: UITableView {
    //var featuresList: [CommunityFeature]
    //Convert to list from API
    var featuresList:[CommunityFeature] = [CommunityFeature(name: "Ambassador Program", description: "", id: "0"), CommunityFeature(name: "Events Board", description: "", id: "1"), CommunityFeature(name: "Events Map", description: "", id: "2"), CommunityFeature(name: "Carpool Coordination", description: "", id: "3"), CommunityFeature(name: "Get To Know You", description: "", id: "4")]
    
    var selectedFeatures: [String] = []
    
    //var onFeatureSelected: (_ event: CommunityFeature) -> () = {_ in }
    
    init(frame: CGRect) {
        let style: UITableViewStyle = UITableViewStyle.plain
        //onFeatureSelected = featureSelectedCallback
        //self.featuresList = featuresList
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(FeatureTableCell.self, forCellReuseIdentifier: "featureCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadEvents(features: [CommunityFeature]) {
        self.featuresList = features
        self.reloadData()
    }
}

extension FeaturesTableSelector: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featuresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "featureCell") as! FeatureTableCell
        cell.textLabel?.text = featuresList[indexPath.row].name
        cell.detailTextLabel?.text = featuresList[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //onFeatureSelected(featuresList[indexPath.row])
        self.deselectRow(at: indexPath, animated: true)
        let cell = self.cellForRow(at: indexPath)
        if(cell?.backgroundColor == UIColor.blue) {
            featuresList[indexPath.row].selected = false
            cell?.backgroundColor = UIColor.white
        } else {
            featuresList[indexPath.row].selected = true
            cell?.backgroundColor = UIColor.blue
        }
        selectedFeatures = []
        for feature in featuresList {
            if (feature.selected == true) {
                selectedFeatures.append(feature.id)
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 250
//    }
}
