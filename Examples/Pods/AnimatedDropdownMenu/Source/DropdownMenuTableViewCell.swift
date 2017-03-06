//
//  DropdownMenuTableViewCell.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/2/28.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

public class DropdownMenuTableViewCell: UITableViewCell {
    
    var iconImageView: UIImageView!
    var cellSeparator: DropdownMenuCellSeparator!
    var cellContentFrame: CGRect!
    var dropdownMenuConfig: DropdownMenuConfig!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, config: DropdownMenuConfig) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dropdownMenuConfig = config
        cellContentFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: dropdownMenuConfig.cellHeight)
        contentView.backgroundColor = dropdownMenuConfig.cellBackgroundColor
        selectionStyle = .none
        
        textLabel?.textColor = dropdownMenuConfig.cellTextLabelColor
        textLabel?.font = dropdownMenuConfig.cellTextLabelFont
        textLabel!.textAlignment = dropdownMenuConfig.cellTextLabelAlignment
        
        iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 16.0, height: 16.0))
        iconImageView.image = dropdownMenuConfig.cellIconImage
        iconImageView.contentMode = .scaleAspectFill
        contentView.addSubview(iconImageView)
        
        switch textLabel!.textAlignment {
        case .left:
            textLabel?.frame = CGRect(x: 42, y: 0, width: cellContentFrame.width - 42, height: cellContentFrame.height)
            iconImageView.frame = CGRect(x: 16, y: (textLabel?.center.y)! - 8, width: 16, height: 16)
            break
        case .center:
            textLabel?.frame = cellContentFrame
            iconImageView.frame = .zero
        default:
            break
        }
        
        //Add Separator for Cell
        cellSeparator = DropdownMenuCellSeparator(frame: CGRect(x: 0, y: cellContentFrame.height, width: cellContentFrame.width, height: 1))
        if let cellSeparatorColor = dropdownMenuConfig.cellSeparatorColor {
            cellSeparator.separatorColor = cellSeparatorColor
        }
        contentView.addSubview(cellSeparator)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        bounds = cellContentFrame
        contentView.frame = bounds
    }
}
