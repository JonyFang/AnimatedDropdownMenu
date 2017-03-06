<p align="center">
    <img src="https://dn-ynvsu4wa.qbox.me/16f7940346e6cfc5ddf9.png" alt="AnimatedDropdownMenu" title="AnimatedDropdownMenu" width="1000">
</p>

**AnimatedDropdownMenu** is a clean interface dropdown menu, appears underneath navigation bar to display a list of related items when you click on the navigation title.

<p align="center">
    <a href="https://cocoapods.org/pods/AnimatedDropdownMenu"><img src="https://img.shields.io/cocoapods/p/AnimatedDropdownMenu.svg?style=flat"></a>
    <a href="https://cocoapods.org/pods/AnimatedDropdownMenu"><img src="https://img.shields.io/badge/iOS-8.0%2B-blue.svg"></a>
    <a href="https://cocoapods.org/pods/AnimatedDropdownMenu"><img src="https://img.shields.io/badge/Swift-3.0%2B-orange.svg"></a>
    <a href="https://cocoapods.org/pods/AnimatedDropdownMenu"><img src="https://img.shields.io/cocoapods/v/AnimatedDropdownMenu.svg?style=flat"></a>
    <a href="http://mit-license.org"><img src="https://img.shields.io/cocoapods/l/AnimatedDropdownMenu.svg?style=flat"></a>
</p>


<p align="center">
    <table>
    <tr>
    <th>Type 01</th>
    <th>Type 02</th>
    <th>Type 03</th>
    </tr>
    <tr>
    <td><img src="https://dn-ynvsu4wa.qbox.me/85482a9232c248ab5aca.PNG"/></td>
    <td><img src="https://dn-ynvsu4wa.qbox.me/8767106baa384ee28bc3.PNG"/></td>
    <td><img src="https://dn-ynvsu4wa.qbox.me/bc46b32aacf22b459e63.PNG"/></td>
    </tr>
    <tr>
    <th>Type 04</th>
    <th>Type 05</th>
    <th>Type 06</th>
    </tr>
    <tr>
    <td><img src="https://dn-ynvsu4wa.qbox.me/4da2351118cda94556c3.PNG"/></td>
    <td><img src="https://dn-ynvsu4wa.qbox.me/fd8abea53051a404745b.PNG"/></td>
    <td><img src="https://dn-ynvsu4wa.qbox.me/951d3cf13599fd5cc307.PNG"/></td>
    </tr>
    <tr>
    <th>Type 07</th>
    <th>Type 08</th>
    <th>Type 09</th>
    </tr>
    <tr>
    <td><img src="https://dn-ynvsu4wa.qbox.me/772b9dfd1a1e554073b6.PNG"/></td>
    <td><img src="https://dn-ynvsu4wa.qbox.me/48835d39aae89b6c3212.PNG"/></td>
    <td><img src="https://dn-ynvsu4wa.qbox.me/76fa42336a0d3f7175d7.PNG"/></td>
    </tr>
    </table>
</p>

## Requirements

- Xcode 8.0+
- iOS 8.0+
- Swift 3.0

## Example

To run the example project, clone the repo, and start `Examples` in Xcode.

```ruby
git clone https://github.com/JonyFang/AnimatedDropdownMenu
cd AnimatedDropdownMenu/Examples
pod install --no-repo-update
open Examples.xcworkspace
```

## Installation

### CocoaPods

To integrate AnimatedDropdownMenu into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'AnimatedDropdownMenu'
```

## Usage

### Get Started

Import the library where you want to use it.

```swift
import AnimatedDropdownMenu

class ExampleViewController: UIViewController {
    // MARK: - Properties
    fileprivate var selectedStageIndex: Int = 0
    fileprivate let dropdownItems: [AnimatedDropdownMenu.Item] = [
        AnimatedDropdownMenu.Item.init("EXPLORE", nil, nil),
        AnimatedDropdownMenu.Item.init("POPULAR", nil, nil),
        AnimatedDropdownMenu.Item.init("RECENT", nil, nil)
    ]

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dropdownMenu = AnimatedDropdownMenu(navigationController: navigationController, containerView: view, selectedIndex: selectedStageIndex, items: dropdownItems)
        dropdownMenu.didSelectItemAtIndexHandler = {
            [weak self] selectedIndex in
            guard let strongSelf = self else {
                return
            }
            strongSelf.selectedStageIndex = selectedIndex
            //Configure Selected Action
        }

        navigationItem.titleView = dropdownMenu
    }
}
```

### Customization

Once you have setup the dropdown menu, you can custom the interface of menu. You can override these properties for your favor:

- `menuTitleColor`: **The font of the navigation bar title.** Default is `UIFont.systemFont(ofSize: 16.0)`
- `menuArrowTintColor`: **The tint color of the arrow.** Default is `.darkGray`
- `cellBackgroundColor`: **The color of the cell background.** Default is `RGBA(216, 85, 96, 1)`
- `cellSelectedColor`: **The color of the cell when the cell is selected.** Default is `.clear`
- `cellSeparatorColor`: **The color of the cell separator.** Default is `RGBA(255, 255, 255, 0.3)`
- `cellTextColor`: **The color of the text inside cell.** Default is `RGBA(255, 255, 255, 0.3)`
- `cellTextSelectedColor`: **The color of the text inside cell when the cell is selected.** Default is `.white`
- `cellTextAlignment`: **The alignment of the text inside cell.** Default is `.center`

## Author

- [Weibo: @JonyFang](http://weibo.com/3034766044/profile?topnav=1&wvr=6)
- [Twitter: @JonyFang](https://twitter.com/jony_chunfang)
- [Email: jony.chunfang@gmail.com](mailto:jony.chunfang@gmail.com)

## Contributing

Please open a [new Issue here](https://github.com/JonyFang/AnimatedDropdownMenu/issues/new) if you run into a problem specific to **AnimatedDropdownMenu**, have a feature request, or want to share a comment.

## License

**AnimatedDropdownMenu** is available under the MIT license. See the LICENSE file for more info.
