//
//  AboutDivircityViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class AboutDivircityViewController: BaseViewController {
    var closeButton: TextOnlyButton!
    var scrollView: UIScrollView!
    var titleLabel: UILabel!
    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "About divirCITY"
        
        setupViews()
    }
    
    func setupViews() {
        closeButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 60, y: self.view.frame.minY + 40, width: 40, height: 40), withText: "X")
        closeButton.addTarget(self, action: #selector(backToPreviousPage), for: .touchUpInside)
        
        titleLabel = UILabel(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY + 40, width: self.view.frame.width, height: 50))
        titleLabel.backgroundColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.text = "About divirCITY"
        
        textView = UITextView(frame: CGRect(x: self.view.frame.minX, y: titleLabel.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - titleLabel.frame.maxY))
        textView.text = "   DivirCITY was created by middle schoolers from the Omaha area in conjunction with the after school program GIVE run by non-profit Life Launch. The goal of GIVE is to help promote and serve in community and instill the value of community service within the middle school students. During the fall of 2018 the students from Nathan Hale middle school came up with the idea of building an app to help people get more connected with and involved in their communities.\n\n  The Idea was to create a platform that allowed communities to create a virtual toolbox to help connect its members."
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(textView)
        self.view.addSubview(closeButton)
        self.view.bringSubview(toFront: closeButton)
    }
    
    @objc func backToPreviousPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
