//
//  DropdownMenuTableView.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/2/27.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class DropdownMenuTableView: UITableView {
    
    public struct Item {
        public let title: String
        public let icon: UIImage
        public let iconLight: UIImage
    }
    
    public var selectRowAtIndexPathHandler: ((_ indexPath: Int) -> ())?
    
    fileprivate var selectedIndexPath: Int?
    fileprivate var items: [Item] = []
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, items: [Item], selectedIndexPath: Int) {
        super.init(frame: frame, style: .plain)
        
        self.items = items
        self.selectedIndexPath = selectedIndexPath
        
        delegate = self
        dataSource = self
        separatorStyle = .none
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
        
        //TODO: Configure cell
        let cell = UITableViewCell()
        return cell
    }
}

extension DropdownMenuTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //TODO: guard indexPath
        selectedIndexPath = indexPath.row
        selectRowAtIndexPathHandler!(indexPath.row)
        reloadData()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //TODO: Configure Deselected Cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //TODO: Configure tableViewCell
    }
}
