//
//  FAQViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/10/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class FAQViewController: BaseViewController {
    var closeButton: TextOnlyButton!
    var scrollView: UIScrollView!
    var titleLabel: UILabel!
    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FAQ's"
        
        setupViews()
    }
    
    func setupViews() {
        closeButton = TextOnlyButton(frame: CGRect(x: self.view.frame.maxX - 60, y: self.view.frame.minY + 40, width: 40, height: 40), withText: "X")
        closeButton.addTarget(self, action: #selector(backToPreviousPage), for: .touchUpInside)
        
        titleLabel = UILabel(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY + 40, width: self.view.frame.width, height: 50))
        titleLabel.backgroundColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.text = "FAQ's"
        
        textView = UITextView(frame: CGRect(x: self.view.frame.minX, y: titleLabel.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - titleLabel.frame.maxY))
        textView.text = "Q1. How do I make my own Community?\n\nA. Login or create an account and on your home page click Create Community"
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(textView)
        self.view.addSubview(closeButton)
        self.view.bringSubview(toFront: closeButton)
    }
    
    @objc func backToPreviousPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
