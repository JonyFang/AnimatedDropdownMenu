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
    var cellSelectedColor: UIColor?
    var cellSeparatorColor: UIColor?
    var cellTextLabelColor: UIColor?
    var cellTextLabelFont: UIFont!
    var cellTextLabelAlignment: NSTextAlignment!
    var cellTextLabelSelectedColor: UIColor?
    var cellIconImage: UIImage!
    
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
        //Path for image
        let bundle = Bundle(for: DropdownMenuConfig.self)
        let bundleUrl = bundle.url(forResource: "AnimatedDropdownMenu", withExtension: "bundle")
        let imageBundle = Bundle(url: bundleUrl!)
        let arrowImagePath = imageBundle?.path(forResource: "icon_dropdown_arrow", ofType: "png")
        
        //Default values
        menuTitleColor = UIColor.darkGray
        menuTitleFont = UIFont.systemFont(ofSize: 16.0)
            
        cellHeight = 50.0
        cellBackgroundColor = UIColor.white
        cellSelectedColor = UIColor.darkGray
        cellSeparatorColor = UIColor.darkGray
        cellTextLabelColor = UIColor.darkGray
        cellTextLabelFont = UIFont.systemFont(ofSize: 15.0)
        cellTextLabelAlignment = .left
        cellTextLabelSelectedColor = UIColor.white
        
        arrowTintColor = UIColor.white
        arrowPadding = 10.0
        arrowImage = UIImage(contentsOfFile: arrowImagePath!)
        
        maskBuckgroundColor = UIColor.black
        maskBackgroundOpacity = 0.5
        animationDuration = 0.25
        shouldChangeTitleText = true
        shouldKeepSelectedCellColor = true
    }
}
