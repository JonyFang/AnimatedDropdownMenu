//
//  DropdownMenuConfig.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/2/28.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class DropdownMenuConfig {
    
    var menuTitleColor: UIColor?
    var menuTitleFont: UIFont!
    
    var cellHeight: CGFloat!
    var cellBackgroundColor: UIColor?
    var cellSeparatorColor: UIColor?
    var cellTextLabelColor: UIColor?
    var cellTextLabelFont: UIFont!
    var cellTextLabelAlignment: NSTextAlignment!
    var cellTextLabelSelectedColor: UIColor?
    var cellSelectionColor: UIColor?
    
    var arrowTintColor: UIColor?
    var arrowPadding: CGFloat!
    var arrowImage: UIImage!
    
    var maskBuckgroundColor: UIColor!
    var maskBackgroundOpacity: CGFloat!
    var animationDuration: TimeInterval!
    var shouldChangeTitleText: Bool!
    var shouldKeepSelectedCellColor: Bool!
    
    init() {
        configDefaultValue()
    }
    
    fileprivate func configDefaultValue() {
        //TODO: Add image
        
        menuTitleColor = UIColor.darkGray
        menuTitleFont = UIFont.systemFont(ofSize: 16.0)
            
        cellHeight = 50.0
        cellBackgroundColor = UIColor.white
        cellSeparatorColor = UIColor.darkGray
        cellTextLabelColor = UIColor.darkGray
        cellTextLabelFont = UIFont.systemFont(ofSize: 15.0)
        cellTextLabelAlignment = .left
        cellTextLabelSelectedColor = UIColor.white
        cellSelectionColor = UIColor.darkGray
        
        arrowTintColor = UIColor.white
        arrowPadding = 15.0
        arrowImage = UIImage(contentsOfFile: "")
        
        maskBuckgroundColor = UIColor.black
        maskBackgroundOpacity = 0.5
        animationDuration = 0.25
        shouldChangeTitleText = true
        shouldKeepSelectedCellColor = true
    }
}
