//
//  ViewController.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/2/23.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate let dropdownItems: [AnimatedDropdownMenu.Item] = [
        AnimatedDropdownMenu.Item(
            title: "From | Photography",
            icon: UIImage(named: "icon_unsplash_gray")!,
            iconLight: UIImage(named: "icon_unsplash_light")!
        ),
        AnimatedDropdownMenu.Item(
            title: "From | Artwork",
            icon: UIImage(named: "icon_artand_gray")!,
            iconLight: UIImage(named: "icon_artand_light")!
        ),
        AnimatedDropdownMenu.Item(
            title: "Others",
            icon: UIImage(named: "icon_other_gray")!,
            iconLight: UIImage(named: "icon_other_light")!
        )
    ]
    
    fileprivate var selectedStageIndex: Int = 0
    fileprivate var lastStageIndex: Int = 0
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAnimatedDropdownMenu()
        
        view.backgroundColor = UIColor.menuBackgroundColor()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupAnimatedDropdownMenu() {
        
        let dropdownMenu = AnimatedDropdownMenu(navigationController: navigationController, containerView: view, selectedIndex: selectedStageIndex, items: dropdownItems)
        
        dropdownMenu.cellBackgroundColor = UIColor.menuBackgroundColor()
        dropdownMenu.menuTitleColor = UIColor.menuLightTextColor()
        dropdownMenu.menuArrowTintColor = UIColor.menuLightTextColor()
        dropdownMenu.cellTextColor = UIColor.menuLightGrayColor()
        dropdownMenu.cellTextSelectedColor = UIColor.menuLightTextColor()
        
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
        
        navigationItem.titleView = dropdownMenu
    }
    
    private func selectedAction() {
        print("\(dropdownItems[selectedStageIndex].title)")
    }
    
}

