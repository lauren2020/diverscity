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
    //var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    static func startActivity(view: UIView) {
        print("Activity Started")
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        view.alpha = 0.5
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    static func stopActivity(view: UIView) {
        print("Activity Stopped")
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        view.alpha = 1
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
