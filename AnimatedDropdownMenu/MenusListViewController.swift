//
//  MenusListViewController.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/2.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class MenusListViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Love U"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        resetNavigationBarColor()
    }
    
    fileprivate func resetNavigationBarColor() {
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .white
        
        let textAttributes: [String: Any] = [
        NSForegroundColorAttributeName: UIColor.menuDarkGrayColor(),
        NSFontAttributeName: UIFont.navigationBarTitleFont()
        ]
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

}
