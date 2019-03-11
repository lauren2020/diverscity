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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadCommunity(community: Community) {
        //profileImageHolder.image = community.profileImage
        communityNameLabel.text = community.name
        communityDescriptionPreviewLabel.text = community.description
        //communityTypeIndicator.text = community.type
        communityCityLabel.text = community.location?.getCity()
    }
}

extension CLLocation {
    func getCity() -> String {
        return "Scranton, PA"
    }
}
