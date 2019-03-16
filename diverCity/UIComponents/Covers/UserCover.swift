//
//  UserCover.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/9/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class UserCover: UIView {
    var coverPhoto: UIImageView!
    var profilePhoto: UIImageView!
    var communityTitle: TitleTextView!
    //var menuIcon: MenuIconButton!
    //var menuOptions: [MenuItemButton]
    
    var menuIsOpen: Bool = false
    
    init(frame: CGRect, withTitle title: String, withMenuOptions options: [MenuItemButton]) {
        //136
        coverPhoto = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        profilePhoto = UIImageView(frame: CGRect(x: (frame.width / 2) - 37.5, y: 30, width: 75, height: 75))
        
        //let offset: CGFloat = 85
        //profilePhoto.frame.midX - 100
        communityTitle = TitleTextView(frame: CGRect(x: profilePhoto.frame.midX - ((frame.width - 45) / 2), y: profilePhoto.frame.maxY + 5, width: frame.width - 45, height: 40), withTitle: title)
        communityTitle.textAlignment = .center
        //menuIcon = MenuIconButton(frame: CGRect(x: -45, y: 5, width: 40, height: 40))
        //menuOptions = options
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        //menuIcon!.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        
        profilePhoto.image = UIImage(named: "michaelProfile")
        
        self.addSubview(coverPhoto)
        self.addSubview(profilePhoto)
        self.addSubview(communityTitle!)
        //self.addSubview(menuIcon!)
//        let menuStartPosition: CGFloat = menuIcon!.frame.maxY
//        if (menuOptions.count != 0) {
//            for optionIndex in 0...menuOptions.count - 1 {
//                let buttonOffset: CGFloat = CGFloat(30 * optionIndex)
//                menuOptions[optionIndex].frame = CGRect(x: self.frame.maxX - 150, y: menuStartPosition + buttonOffset, width: menuOptions[optionIndex].frame.width, height: menuOptions[optionIndex].frame.width)
//                self.addSubview(menuOptions[optionIndex])
//            }
//        }
        
       // closeMenu()
    }
    
//    @objc func toggleMenu(_ sender: Any) {
//        if (menuIsOpen) {
//            closeMenu()
//        } else {
//            openMenu()
//        }
//    }
    
//    func openMenu() {
//        menuIsOpen = true
//        for option in menuOptions {
//            option.isHidden = false
//        }
//    }
//
//    func closeMenu() {
//        menuIsOpen = false
//        for option in menuOptions {
//            option.isHidden = true
//        }
//    }
    
    func updateCoverPhoto(image: UIImage) {
        coverPhoto.image = image
    }
    
    func updateProfilePhoto(image: UIImage) {
        profilePhoto.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
