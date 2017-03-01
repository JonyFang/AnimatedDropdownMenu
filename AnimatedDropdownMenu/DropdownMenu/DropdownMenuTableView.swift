//
//  DropdownMenuTableView.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/2/27.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class DropdownMenuTableView: UITableView {
    
    public var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    
    fileprivate var selectedIndex: Int?
    fileprivate var items: [AnimatedDropdownMenu.Item] = []
    fileprivate var dropdownMenuConfig: DropdownMenuConfig!
    fileprivate let kDropdownMenuTableViewCell = "DropdownMenuTableViewCell"
    
    required init?(coder aDecoder: NSCoder) {
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
    }
}

extension DropdownMenuTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = DropdownMenuTableViewCell(style: .default, reuseIdentifier: kDropdownMenuTableViewCell, config: dropdownMenuConfig)
        cell.textLabel?.text = items[indexPath.row].title
        
        return cell
    }
}

extension DropdownMenuTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dropdownMenuConfig.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        selectRowAtIndexPathHandler!(indexPath.row)
        reloadData()
        
//        let cell = tableView.cellForRow(at: indexPath) as? DropdownMenuTableViewCell
//        cell?.contentView.backgroundColor = dropdownMenuConfig.cellSelectionColor
//        cell?.textLabel?.textColor = dropdownMenuConfig.cellTextLabelSelectedColor
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.cellForRow(at: indexPath) as? DropdownMenuTableViewCell
//        cell?.contentView.backgroundColor = dropdownMenuConfig.cellBackgroundColor
//        cell?.textLabel?.textColor = dropdownMenuConfig.cellTextLabelColor
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard dropdownMenuConfig.shouldKeepSelectedCellColor! else {
            return
        }
        
        let tableCell = cell as! DropdownMenuTableViewCell
        
        tableCell.textLabel?.textColor = (indexPath.row == selectedIndex) ?
            dropdownMenuConfig.cellTextLabelSelectedColor :
            dropdownMenuConfig.cellTextLabelColor
        tableCell.iconImageView?.image = (indexPath.row == selectedIndex) ? items[indexPath.row].iconLight : items[indexPath.row].icon
    }
}
