//
//  MenusListTableViewCell.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/2.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class MenusListTableViewCell: UITableViewCell {
    
    public class var reuseIdentifier: String {
        return "\(self)"
    }
    
    public class var requireCellHeight: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth / 375.0 * 184.0
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var menuTypeView: UIView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func previewButtonClicked(_ sender: Any) {
        //TODO: Delegate
    }
}
