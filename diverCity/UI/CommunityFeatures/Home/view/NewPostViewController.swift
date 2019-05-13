//
//  NewPostViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/12/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class NewPostViewController: BaseViewController {
    var viewModel = NewPostViewModel()
    var activityHelper: ActivityHelper = ActivityHelper()
    
    var titleView: TitleTextView!
    var postTitleEntry: UITextField!
    var postContentEntryBox: UITextField!
    var submitPostButton: RectangleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Post"
    }
    
    func setupViews() {
        titleView = TitleTextView(frame: CGRect(x: self.view.frame.minX + 30, y: self.view.frame.minY + 50, width: 75, height: 300), withTitle: "New Post")
        
        submitPostButton = RectangleButton(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.maxY - 50, width: self.view.frame.width, height: 50), withText: "Post")
        submitPostButton.addTarget(self, action: #selector(submitPost), for: .touchUpInside)
        
        postTitleEntry = UITextField(frame: CGRect(x: self.view.frame.minX, y: titleView.frame.maxY + 45, width: self.view.frame.width, height: 50))
        postContentEntryBox = UITextField(frame: CGRect(x: self.view.frame.minX, y: postTitleEntry.frame.maxY, width: self.view.frame.width, height: submitPostButton.frame.minY - postTitleEntry.frame.maxY - 20))
        
        addSubViews()
    }
    
    func addSubViews() {
        self.view.addSubview(titleView)
        self.view.addSubview(postTitleEntry)
        self.view.addSubview(postContentEntryBox)
        self.view.addSubview(submitPostButton)
    }
    
    func setupViewModel() {
        viewModel.startActivityEvent.addSubscriber {
            self.activityHelper.startActivity(view: self.view)
        }
        viewModel.stopActivityEvent.addSubscriber {
            self.activityHelper.stopActivity(view: self.view)
        }
    }
    
    @objc func submitPost(_ sender: Any) {
        
    }
}
