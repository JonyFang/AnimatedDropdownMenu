//
//  DropdownMenuNavigationController.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/1.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class DropdownMenuNavigationController: UINavigationController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        configNavigationBar()
    }
    
    private func configNavigationBar() {
        navigationBar.backgroundColor = nil
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = nil
        navigationBar.barStyle = .black
        navigationBar.setBackgroundImage(nil, for: .default)
        
        let textAttributes: [String: Any] = [
            NSForegroundColorAttributeName: UIColor.menuLightTextColor(),
            NSFontAttributeName: UIFont.navigationBarTitleFont()
        ]
        
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.tintColor = UIColor.menuLightTextColor()
        
        navigationBar.barTintColor = UIColor.menuLightTextColor()
    }
}
