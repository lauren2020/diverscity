//
//  SideBarMenu.swift
//  diverCity
//
//  Created by Lauren Shultz on 3/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation
import UIKit

class SideBarMenu: UIView {
    init(frame: CGRect, menuItems: [MenuItem], viewController: UIViewController) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        
        if (menuItems.count != 0) {
            for index in 0...menuItems.count - 1 {
                let newMenuButton = MenuItemButton(frame: CGRect(x: 0, y: CGFloat(index * 30), width: frame.width, height: 30), withTaskName: menuItems[index].title)
                newMenuButton.addTarget(viewController, action: menuItems[index].selector, for: .touchUpInside)
                self.addSubview(newMenuButton)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
