//
//  MenusListViewController.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/2.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class MenusListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
        
        title = "DropdownMenus"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        resetNavigationBarColor()
    }
    
    // MARK: - Private Methods
    fileprivate func resetNavigationBarColor() {
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .white
        
        let textAttributes: [String: Any] = [
        NSForegroundColorAttributeName: UIColor.menuDarkGrayColor(),
        NSFontAttributeName: UIFont.navigationBarTitleFont()
        ]
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    fileprivate func setupTableView() {
        tableView.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        tableView.register(UINib(nibName: MenusListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MenusListTableViewCell.reuseIdentifier)
    }

}

extension MenusListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenusListConfig.MenusListCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellConfig = MenusListConfig.MenusListCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MenusListTableViewCell.reuseIdentifier) as! MenusListTableViewCell
        
        cell.menuTitleLabel.text = cellConfig.menuTitle
        cell.nameLabel.text = cellConfig.name
        cell.descriptionLabel.text = cellConfig.description
        cell.menuTypeView.backgroundColor = cellConfig.color
        
        return cell
    }
}

extension MenusListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenusListTableViewCell.requireCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vc = UIViewController()
        
        if indexPath.row == 0 {
            vc = LeftTypeOneViewController()
        }
        else if indexPath.row == 1 {
            vc = LeftTypeTwoViewController()
        }
        else if indexPath.row == 2 {
            vc = LeftTypeTreeViewController()
        }
        else if indexPath.row == 3 {
            vc = LeftTypeFourViewController()
        }
        else if indexPath.row == 4 {
            vc = LeftTypeFiveViewController()
        }
        else if indexPath.row == 5 {
            vc = LeftTypeSixViewController()
        }
        else if indexPath.row == 6 {
            vc = CenterTypeOneViewController()
        }
        else if indexPath.row == 7 {
            vc = CenterTypeTwoViewController()
        }
        else if indexPath.row == 8 {
            vc = CenterTypeThreeViewController()
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
