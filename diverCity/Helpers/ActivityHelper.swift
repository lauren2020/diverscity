//
//  ActivityHelper.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/1/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class ActivityHelper {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func startActivity(view: UIView) {
        print("Activity Started")
        view.alpha = 0.5
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopActivity(view: UIView) {
        print("Activity Stopped")
        view.alpha = 1
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
