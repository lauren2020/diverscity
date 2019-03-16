//
//  UserSettingsViewController.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/12/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class UserSettingsViewController: BaseViewController {
    var scrollView: UIScrollView!
    var personalInfoTitle: UILabel!
    var nameTextField: SetableTextField!
    var emailTextField: SetableTextField!
    var phoneNumberTextField: SetableTextField!
    var divider1: Divider!
    
    var addressTitle: UILabel!
    var addressTextField: SetableTextField!
    var cityTextField: SetableTextField!
    var stateTextField: SetableTextField!
    var zipTextField: SetableTextField!
    var divider2: Divider!
    
    var tagsTitle: UILabel!
    //var tagsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        self.view.backgroundColor = UIColor.white
        setupViews()
    }
    
    func setupViews() {
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(enableEditMode))]
        scrollView = UIScrollView(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.minY, width: self.view.frame.width, height: self.view.frame.height))
        setupPersonalInfo()
        setupAddress()
        setupTags()
        
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: tagsTitle.frame.maxY)
        
        addSubviews()
    }
    
    func setupPersonalInfo() {
        personalInfoTitle = UILabel(frame: CGRect(x: scrollView.frame.minX + 20, y: scrollView.frame.minY + 20, width: scrollView.frame.width, height: 30))
        personalInfoTitle.text = "Personal Info"
        
        nameTextField = SetableTextField(frame: CGRect(x: scrollView.frame.minX + 20, y: personalInfoTitle.frame.maxY + 10, width: scrollView.frame.width - 40, height: 40), hint: "Name", defaultEditing: false)
        emailTextField = SetableTextField(frame: CGRect(x: scrollView.frame.minX + 20, y: nameTextField.frame.maxY + 10, width: scrollView.frame.width - 40, height: 40), hint: "Email", defaultEditing: false)
        phoneNumberTextField = SetableTextField(frame: CGRect(x: scrollView.frame.minX + 20, y: emailTextField.frame.maxY + 10, width: scrollView.frame.width - 40, height: 40), hint: "Phone", defaultEditing: false)
        
        divider1 = Divider(origin: CGPoint(x: scrollView.frame.minX, y: phoneNumberTextField.frame.maxY + 10), width: scrollView.frame.width)
    }
    
    func setupAddress() {
        addressTitle = UILabel(frame: CGRect(x: scrollView.frame.minX + 20, y: divider1.frame.maxY + 10, width: scrollView.frame.width - 40, height: 30))
        addressTitle.text = "Address"
        
        addressTextField = SetableTextField(frame: CGRect(x: scrollView.frame.minX + 20, y: addressTitle.frame.maxY + 10, width: scrollView.frame.width - 40, height: 40), hint: "Address", defaultEditing: false)
        cityTextField = SetableTextField(frame: CGRect(x: scrollView.frame.minX + 20, y: addressTextField.frame.maxY + 10, width: scrollView.frame.width - 40, height: 40), hint: "City", defaultEditing: false)
        stateTextField = SetableTextField(frame: CGRect(x: scrollView.frame.minX + 20, y: cityTextField.frame.maxY + 10, width: scrollView.frame.width - 40, height: 40), hint: "State", defaultEditing: false)
        zipTextField = SetableTextField(frame: CGRect(x: scrollView.frame.minX + 20, y: stateTextField.frame.maxY + 10, width: scrollView.frame.width - 40, height: 40), hint: "Zipcode", defaultEditing: false)
        
        divider2 = Divider(origin: CGPoint(x: scrollView.frame.minX, y: zipTextField.frame.maxY + 10), width: scrollView.frame.width)
    }
    
    func setupTags() {
        tagsTitle = UILabel(frame: CGRect(x: scrollView.frame.minX + 20, y: divider2.frame.maxY + 10, width: 100, height: 30))
        tagsTitle.text = "Tags"
    }
    
    func addSubviews() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(personalInfoTitle)
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(phoneNumberTextField)
        scrollView.addSubview(divider1)
        scrollView.addSubview(addressTitle)
        scrollView.addSubview(addressTextField)
        scrollView.addSubview(cityTextField)
        scrollView.addSubview(stateTextField)
        scrollView.addSubview(zipTextField)
        scrollView.addSubview(divider2)
        scrollView.addSubview(tagsTitle)
    }
    
    @objc func enableEditMode(_ sender: Any) {
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(disableEditMode))]
    }
    
    @objc func disableEditMode(_ sender: Any) {
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(enableEditMode))]
    }
}
