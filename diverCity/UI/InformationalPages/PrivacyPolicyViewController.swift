//
//  PrivacyPolicyViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class PrivacyPolicyViewController: BaseViewController {
    var closeButton: TextOnlyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        closeButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 60, y: self.view.frame.minY + 40, width: 40, height: 40), withText: "X")
        closeButton.addTarget(self, action: #selector(backToPreviousPage), for: .touchUpInside)
        
        self.view.addSubview(closeButton)
    }
    
    @objc func backToPreviousPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
