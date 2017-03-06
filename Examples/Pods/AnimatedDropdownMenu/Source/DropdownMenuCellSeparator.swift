//
//  DropdownMenuCellSeparator.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/2.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

public class DropdownMenuCellSeparator: UIView {

    var separatorColor: UIColor {
        get {
            return self.backgroundColor!
        }
        set(value) {
            self.backgroundColor = value
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize() {
        backgroundColor = UIColor.clear
    }
}
