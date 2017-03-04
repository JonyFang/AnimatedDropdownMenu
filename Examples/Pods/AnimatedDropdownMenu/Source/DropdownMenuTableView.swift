//
//  DropdownMenuTableView.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/2/27.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

public class DropdownMenuTableView: UITableView {
    
    public var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    
    fileprivate var selectedIndex: Int?
    fileprivate var items: [AnimatedDropdownMenu.Item] = []
    fileprivate var dropdownMenuConfig: DropdownMenuConfig!
    fileprivate let kDropdownMenuTableViewCell = "DropdownMenuTableViewCell"
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, items: [AnimatedDropdownMenu.Item], selectedIndex: Int, config: DropdownMenuConfig) {
        super.init(frame: frame, style: .plain)
        
        self.items = items
        self.selectedIndex = selectedIndex
        self.dropdownMenuConfig = config
        
        delegate = self
        dataSource = self
        separatorStyle = .none
        backgroundColor = .clear
        autoresizingMask = .flexibleWidth
        isScrollEnabled = false
    }
}

extension DropdownMenuTableView: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = DropdownMenuTableViewCell(style: .default, reuseIdentifier: kDropdownMenuTableViewCell, config: dropdownMenuConfig)
        cell.textLabel?.text = items[indexPath.row].title
        
        return cell
    }
}

extension DropdownMenuTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dropdownMenuConfig.cellHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        selectRowAtIndexPathHandler!(indexPath.row)
        reloadData()
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard dropdownMenuConfig.shouldKeepSelectedCellColor! else {
            return
        }
        
        let tableCell = cell as! DropdownMenuTableViewCell
        let icon: UIImage? = items[indexPath.row].icon
        let iconLight: UIImage? = items[indexPath.row].iconLight
        
        if icon != nil && iconLight != nil {
            tableCell.iconImageView?.image = (indexPath.row == selectedIndex) ? iconLight : icon
        }
        
        if dropdownMenuConfig.cellSelectedColor != .clear {
            cell.contentView.backgroundColor = (indexPath.row == selectedIndex) ?
                dropdownMenuConfig.cellSelectedColor :
                dropdownMenuConfig.cellBackgroundColor
        }
        
        if dropdownMenuConfig.cellTextLabelSelectedColor != .clear {
            tableCell.textLabel?.textColor = (indexPath.row == selectedIndex) ?
                dropdownMenuConfig.cellTextLabelSelectedColor :
                dropdownMenuConfig.cellTextLabelColor
        }
        
        guard (dropdownMenuConfig.cellSeparatorColor != nil) else {
            return
        }
        
        if indexPath.row == items.count - 1 {
            tableCell.cellSeparator.separatorColor = .clear
        }
        else {
            tableCell.cellSeparator.separatorColor = dropdownMenuConfig.cellSeparatorColor!
        }
    }
}
