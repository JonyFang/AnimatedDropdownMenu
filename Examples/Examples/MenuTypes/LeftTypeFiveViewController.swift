//
//  LeftTypeFiveViewController.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/3.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit
import AnimatedDropdownMenu

class LeftTypeFiveViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate let dropdownItems: [AnimatedDropdownMenu.Item] = [
        AnimatedDropdownMenu.Item.init("From | Photography", nil, nil),
        AnimatedDropdownMenu.Item.init("From | Artwork", nil, nil),
        AnimatedDropdownMenu.Item.init("Others", nil, nil)
    ]
    
    fileprivate var selectedStageIndex: Int = 0
    fileprivate var lastStageIndex: Int = 0
    fileprivate var dropdownMenu: AnimatedDropdownMenu!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAnimatedDropdownMenu()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        resetNavigationBarColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        dropdownMenu.show()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupAnimatedDropdownMenu() {
        
        let dropdownMenu = AnimatedDropdownMenu(navigationController: navigationController, containerView: view, selectedIndex: selectedStageIndex, items: dropdownItems)
        
        dropdownMenu.cellBackgroundColor = UIColor.menuLightRedColor()
        dropdownMenu.cellSelectedColor = UIColor.menuDarkRedColor()
        dropdownMenu.menuTitleColor = UIColor.menuLightTextColor()
        dropdownMenu.menuArrowTintColor = UIColor.menuLightTextColor()
        dropdownMenu.cellTextColor = UIColor.menuLightTextColor()
        
        dropdownMenu.didSelectItemAtIndexHandler = {
            [weak self] selectedIndex in
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.lastStageIndex = strongSelf.selectedStageIndex
            strongSelf.selectedStageIndex = selectedIndex
            
            guard strongSelf.selectedStageIndex != strongSelf.lastStageIndex else {
                return
            }
            
            //Configure Selected Action
            strongSelf.selectedAction()
        }
        
        self.dropdownMenu = dropdownMenu
        navigationItem.titleView = dropdownMenu
    }
    
    private func selectedAction() {
        print("\(dropdownItems[selectedStageIndex].title)")
    }
    
    fileprivate func resetNavigationBarColor() {
        
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor.menuLightRedColor()
        
        let textAttributes: [String: Any] = [
            NSForegroundColorAttributeName: UIColor.menuLightTextColor(),
            NSFontAttributeName: UIFont.navigationBarTitleFont()
        ]
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

}
