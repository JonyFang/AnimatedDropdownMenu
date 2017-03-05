//
//  AnimatedDropdownMenu.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/2/27.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

public class AnimatedDropdownMenu: UIView {
    
    public struct Item {
        public let title: String
        public let icon: UIImage?
        public let iconLight: UIImage?
        
        public init(_ title: String, _ icon: UIImage?, _ iconLight: UIImage?) {
            self.title = title
            self.icon = icon
            self.iconLight = iconLight
        }
    }
    
    public var didSelectItemAtIndexHandler: ((_ indexPath: Int) -> ())?
    public var isShown: Bool! = false
    
    public var menuTitleColor: UIColor! {
        get {
            return dropdownConfig.menuTitleColor
        }
        set(value) {
            dropdownConfig.menuTitleColor = value
        }
    }
    
    public var menuArrowTintColor: UIColor! {
        get {
            return dropdownConfig.arrowTintColor
        }
        set(value) {
            dropdownConfig.arrowTintColor = value
            menuArrow.tintColor = dropdownConfig.arrowTintColor
        }
    }
    
    public var cellBackgroundColor: UIColor! {
        get {
            return dropdownConfig.cellBackgroundColor
        }
        set(value) {
            dropdownConfig.cellBackgroundColor = value
        }
    }
    
    public var cellSelectedColor: UIColor! {
        get{
            return dropdownConfig.cellSelectedColor
        }
        set(value) {
            dropdownConfig.cellSelectedColor = value
        }
    }
    
    public var cellSeparatorColor: UIColor! {
        get {
            return dropdownConfig.cellSeparatorColor
        }
        set(value) {
            dropdownConfig.cellSeparatorColor = value
        }
    }
    
    public var cellTextColor: UIColor! {
        get {
            return dropdownConfig.cellTextLabelColor
        }
        set(value) {
            dropdownConfig.cellTextLabelColor = value
        }
    }
    
    public var cellTextSelectedColor: UIColor! {
        get {
            return dropdownConfig.cellTextLabelSelectedColor
        }
        set(value) {
            dropdownConfig.cellTextLabelSelectedColor = value
        }
    }
    
    public var cellTextAlignment: NSTextAlignment! {
        get {
            return dropdownConfig.cellTextLabelAlignment
        }
        set(value) {
            dropdownConfig.cellTextLabelAlignment = value
        }
    }
    
    fileprivate weak var navigationController: UINavigationController?
    fileprivate var menuButton: UIButton!
    fileprivate var menuTitleLabel: UILabel!
    fileprivate var menuArrow: UIImageView!
    fileprivate var menuWrapper: UIView!
    fileprivate var backgroundView: UIView!
    fileprivate var tableView: DropdownMenuTableView!
    
    fileprivate var items:[Item]!
    fileprivate var dropdownConfig = DropdownMenuConfig()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func show() {
        if isShown == false {
            showMenu()
        }
    }
    
    public func dismiss() {
        if isShown == true {
            hideMenu()
        }
    }
    
    public init(navigationController: UINavigationController!, containerView: UIView!, selectedIndex: Int!, items: [Item]!) {
        guard let window = UIApplication.shared.keyWindow else {
            super.init(frame: .zero)
            return
        }
        
        //Navigation Controller
        if let navigationController = navigationController {
            self.navigationController = navigationController
        }
        else {
            self.navigationController = window.rootViewController?.topViewController?.navigationController
        }
        
        let title = items[selectedIndex].title
        
        //Get titleSize
        let titleSize = (title as NSString).size(attributes: [NSFontAttributeName: dropdownConfig.menuTitleFont])
        
        //Init frame
        let frame = CGRect(x: 0, y: 0, width: titleSize.width + dropdownConfig.arrowPadding + dropdownConfig.arrowImage.size.width * 2, height: navigationController.navigationBar.frame.height)
        
        super.init(frame: frame)
        
        
        self.isShown = false
        self.items = items
        
        
        //Setup Navigation Menu
        menuButton = UIButton(frame: frame)
        menuButton.addTarget(self, action: #selector(self.menuButtonTapped(_:)), for: .touchUpInside)
        
        menuTitleLabel = UILabel(frame: frame)
        menuTitleLabel.text = title
        menuTitleLabel.textColor = dropdownConfig.menuTitleColor
        menuTitleLabel.font = dropdownConfig.menuTitleFont
        menuTitleLabel.textAlignment = dropdownConfig.cellTextLabelAlignment
        
        menuArrow = UIImageView(image: dropdownConfig.arrowImage.withRenderingMode(.alwaysTemplate))
        menuArrow.tintColor = dropdownConfig.arrowTintColor
        
        addSubview(menuButton)
        menuButton.addSubview(menuTitleLabel)
        menuButton.addSubview(menuArrow)
        
        
        let menuWrapperBounds = window.bounds
        
        //Setup DropdownMenu
        menuWrapper = UIView(frame: menuWrapperBounds)
        menuWrapper.clipsToBounds = true
        
        //Setup BackgroundView
        backgroundView = UIView(frame: menuWrapperBounds)
        backgroundView.backgroundColor = dropdownConfig.maskBuckgroundColor
        
        let backgroundTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(AnimatedDropdownMenu.hideMenu))
        backgroundView.addGestureRecognizer(backgroundTapRecognizer)
        
        //Setup Default Configuratin
        //setupDefaultConfiguration()
        
        //Setup TableView
        tableView = DropdownMenuTableView(frame: CGRect(x: menuWrapperBounds.origin.x, y: -300.0, width: menuWrapperBounds.width, height: 300.0 + dropdownConfig.cellHeight * CGFloat(items.count)), items: items, selectedIndex: selectedIndex, config: dropdownConfig)
        tableView.layer.cornerRadius = 5.0
        tableView.layer.masksToBounds = true
        tableView.selectRowAtIndexPathHandler = {
            [weak self] selectedIndex in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.didSelectItemAtIndexHandler!(selectedIndex)
            strongSelf.menuTitleLabel.text = strongSelf.items[selectedIndex].title
            
            strongSelf.hideMenu()
            strongSelf.layoutSubviews()
        }
        
        menuWrapper.addSubview(backgroundView)
        menuWrapper.addSubview(tableView)
        containerView.addSubview(menuWrapper)
        
        menuWrapper.isHidden = true
    }
    
    // MARK: - Life Cycle
    
    override public func layoutSubviews() {
        
        menuTitleLabel.sizeToFit()
        menuTitleLabel.center = CGPoint(x: frame.size.width * 0.5, y: frame.size.height * 0.5)
        menuTitleLabel.textColor = dropdownConfig.menuTitleColor
        
        menuArrow.center = CGPoint(x: menuTitleLabel.frame.maxX + dropdownConfig.arrowPadding, y: frame.size.height * 0.5)
        
        menuWrapper.frame.origin.y = (navigationController?.navigationBar.frame.maxY)!
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupDefaultConfiguration() {
        
        menuTitleColor = navigationController?.navigationBar.titleTextAttributes?[NSForegroundColorAttributeName] as? UIColor
        cellBackgroundColor = navigationController?.navigationBar.barTintColor
        cellTextColor = menuTitleColor
        cellSeparatorColor = .clear
        
        menuArrowTintColor = menuTitleColor
    }
    
    @objc fileprivate func menuButtonTapped(_ sender: UIButton) {
        isShown == true ? hideMenu() : showMenu()
    }
    
    @objc fileprivate func hideMenu() {
        isShown = false
        menuButton.isUserInteractionEnabled = false
        
        //Rotate Arrow
        rotateArrowAnimation()
        
        //Wapper Animation
        backgroundView.alpha = dropdownConfig.maskBackgroundOpacity
        
        UIView.animate(withDuration: dropdownConfig.animationDuration,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5,
                       options: UIViewAnimationOptions(),
                       animations: {
                        self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.dropdownConfig.cellHeight - 300.0
                        self.backgroundView.alpha = 0
        }) { finished in
            self.menuWrapper.isHidden = true
            self.menuButton.isUserInteractionEnabled = true
        }
    }
    
    fileprivate func showMenu() {
        isShown = true
        menuButton.isUserInteractionEnabled = false
        
        menuWrapper.frame.origin.y = (navigationController?.navigationBar.frame.maxY)!
        
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 300))
        tableHeaderView.backgroundColor = dropdownConfig.cellBackgroundColor
        tableView.tableHeaderView = tableHeaderView
        
        //Rotate Arrow
        rotateArrowAnimation()
        
        //Wapper Animation
        menuWrapper.isHidden = false
        backgroundView.alpha = 0
        
        tableView.frame.origin.y = -CGFloat(items.count) * dropdownConfig.cellHeight - 300.0
        tableView.reloadData()
        
        menuWrapper.superview?.bringSubview(toFront: menuWrapper)
        
        UIView.animate(withDuration: dropdownConfig.animationDuration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: { 
            self.tableView.frame.origin.y = CGFloat(-300.0)
            self.backgroundView.alpha = self.dropdownConfig.maskBackgroundOpacity
        }) { finished in
            self.menuButton.isUserInteractionEnabled = true
        }
    }
    
    fileprivate func rotateArrowAnimation() {
        UIView.animate(withDuration: dropdownConfig.animationDuration) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.menuArrow.transform = strongSelf.menuArrow.transform.rotated(by: 180 * CGFloat(M_PI/180))
        }
    }
    
}

extension UIViewController {
    
    //Get top visible ViewController in top present level
    fileprivate var topViewController: UIViewController? {
        return topPresentedViewController?.topVisibleViewController
    }
    
    //Get top presented ViewController
    private var topPresentedViewController: UIViewController? {
        
        var target: UIViewController? = self
        if target?.presentedViewController != nil {
            target = target?.presentedViewController
        }
        
        return target
    }
    
    //Get top visible ViewController
    private var topVisibleViewController: UIViewController? {
        
        if let navigation = self as? UINavigationController {
            if let visibleViewController = navigation.visibleViewController {
                return visibleViewController.topVisibleViewController
            }
        }
        if let tab = self as? UITabBarController {
            if let selectedViewController = tab.selectedViewController {
                return selectedViewController.topVisibleViewController
            }
        }
        
        return self
    }
    
}
