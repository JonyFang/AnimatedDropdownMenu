//
//  MenusListConfig.swift
//  AnimatedDropdownMenu
//
//  Created by JonyFang on 17/3/3.
//  Copyright © 2017年 JonyFang. All rights reserved.
//

import UIKit

class MenusListConfig: NSObject {
    
    struct MenusListCellConfig {
        let menuTitle: String
        let name: String
        let description: String
        let color: UIColor!
    }
    
    public class var MenusListCells: [MenusListCellConfig]{
        return [
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 01",
                name: "LEFT TYPE 01",
                description: "Icon & TextColor",
                color: UIColor.menuGreeColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 02",
                name: "LEFT TYPE 02",
                description: "Icon & CellSelectedColor",
                color: UIColor.menuLightRedColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 03",
                name: "LEFT TYPE 03",
                description: "Icon & TextColor & Separator",
                color: UIColor.menuPurpleColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 04",
                name: "LEFT TYPE 04",
                description: "TextColor",
                color: UIColor.menuGreeColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 05",
                name: "LEFT TYPE 05",
                description: "CellSelectedColor",
                color: UIColor.menuLightRedColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 06",
                name: "LEFT TYPE 06",
                description: "TextColor & Separator",
                color: UIColor.menuPurpleColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 07",
                name: "CENTER TYPE 01",
                description: "TextColor",
                color: UIColor.menuGreeColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 08",
                name: "CENTER TYPE 02",
                description: "CellSelectedColor",
                color: UIColor.menuLightRedColor()
            ),
            MenusListCellConfig(
                menuTitle: "DropdownMenu Type 09",
                name: "CENTER TYPE 03",
                description: "Separator",
                color: UIColor.menuPurpleColor()
            ),
        ]
    }
}
