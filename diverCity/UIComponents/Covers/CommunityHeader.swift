//
//  CommunityHeader.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/8/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class CommunityHeader: UIView {
    var communityTitle: TitleTextView!
    //var menuIcon: MenuIconButton!
    //var menuOptions: [MenuItemButton]
    
    //var menuIsOpen: Bool = false
    
    init(frame: CGRect, withTitle title: String, withMenuOptions options: [MenuItemButton]) {
        //136
        //let offset: CGFloat = 85
        communityTitle = TitleTextView(frame: CGRect(x: 5, y: 5, width: frame.width - 45, height: frame.height - 10), withTitle: title)
        //menuIcon = MenuIconButton(frame: CGRect(x: frame.maxX - 45, y: frame.minY + 5 - offset, width: 40, height: 40))
        //menuOptions = options
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(communityTitle!)
        //self.addSubview(menuIcon!)
        //let menuStartPosition: CGFloat = menuIcon!.frame.maxY
//        if (menuOptions.count != 0) {
//        for optionIndex in 0...menuOptions.count - 1 {
//            let buttonOffset: CGFloat = CGFloat(30 * optionIndex)
//            menuOptions[optionIndex].frame = CGRect(x: self.frame.maxX - 150, y: menuStartPosition + buttonOffset, width: menuOptions[optionIndex].frame.width, height: menuOptions[optionIndex].frame.width)
//            self.addSubview(menuOptions[optionIndex])
//        }
//        }
//
//        closeMenu()
    }
    
//    @objc func toggleMenu(_ sender: Any) {
//        if (menuIsOpen) {
//            closeMenu()
//        } else {
//            openMenu()
//        }
//    }
//
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
