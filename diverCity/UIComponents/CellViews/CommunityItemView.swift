//
//  CommunityItemView.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class CommunityItemView: UIView {
    var profileImageHolder: UIImageView!
    var communityNameLabel: UILabel!
    var communityTypeIndicator: UILabel!
    var communityDescriptionPreviewLabel: UILabel!
    var communityCityLabel: UILabel!
    
    init(x: CGFloat, y: CGFloat, width: CGFloat) {
        let frame = CGRect(x: x, y: y, width: width, height: 305)
        super.init(frame: frame)
        
        profileImageHolder = UIImageView(frame: CGRect(x: 10, y: 10, width: 70, height: 70))
        communityNameLabel = UILabel(frame: CGRect(x: profileImageHolder.frame.maxX + 10, y: 10, width: frame.width - 100, height: 40))
        
        communityDescriptionPreviewLabel = UILabel(frame: CGRect(x: profileImageHolder.frame.maxX + 10, y: communityNameLabel.frame.maxY + 10, width: 200, height: 30))
        
        communityTypeIndicator = UILabel(frame: CGRect(x: 10, y: profileImageHolder.frame.maxY + 10, width: 100, height: 30))
        communityCityLabel = UILabel(frame: CGRect(x: communityTypeIndicator.frame.maxX + 10, y: profileImageHolder.frame.maxY + 10, width: 100, height: 30))
        
        self.addSubview(profileImageHolder)
        self.addSubview(communityNameLabel)
        self.addSubview(communityDescriptionPreviewLabel)
        self.addSubview(communityTypeIndicator)
        self.addSubview(communityCityLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadCommunity(community: Community) {
        profileImageHolder.image = UIImage(named: "theOfficeBuilding")//community.profileImage
        communityNameLabel.text = community.name
        communityDescriptionPreviewLabel.text = community.description
        communityTypeIndicator.text = "BUSINESS"//community.type
        communityCityLabel.text = community.location?.getCity()
    }
}

extension CLLocation {
    func getCity() -> String {
        return "Scranton, PA"
    }
}
