# YYExtentions

[![CI Status](https://img.shields.io/travis/YaoChengZhen/YYExtentions.svg?style=flat)](https://travis-ci.org/YaoChengZhen/YYExtentions)
[![Version](https://img.shields.io/cocoapods/v/YYExtentions.svg?style=flat)](https://cocoapods.org/pods/YYExtentions)
[![License](https://img.shields.io/cocoapods/l/YYExtentions.svg?style=flat)](https://cocoapods.org/pods/YYExtentions)
[![Platform](https://img.shields.io/cocoapods/p/YYExtentions.svg?style=flat)](https://cocoapods.org/pods/YYExtentions)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

YYExtentions is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

target 'TargetName' do
pod 'YYExtentions', 
end
```
Then, run the following command:

```ruby
$ pod install
```
### Info
优点：不会影响现有的扩展，完全不侵入方式的扩展调用类似：view.snp.xxx
BlockButton: UIbutton Block功能
YDateExtention: 日期扩展
YStringExtention: 有关String扩展，功能有：Md5加密、有关密码、邮箱、车牌号、手机号、URL链接等等的校验
YViewControllerExtntion: 目前仅仅只有：导航栏左右按钮封装
YViewExtention: View扩展，frame的扩展

### Usage

UIViewController

```ruby
import YYExtentions
//如果你想要全局是只导入一次的话，用如下导入：
//@_exported import YYExtentions

override func viewDidLoad() {
    super.viewDidLoad()
    yy_kit.addLeftBtn("Hello") { [weak self](btn) in
    print("Hello world")
    }
}
```
String
```ruby

"123456".yy_kit.toMd5Lower  //MD5加密返回：String
"1788777".yy_kit.isMobile // 手机号校验返回：Bool
```
View 
```ruby
let centerX: CGFloat = view.yy_kit.centerX //获取
view.yy_kit.setHeight(100)
view.yy_kit.setCenterX(300)//设置中心点
```
## Author

BruceYao
2550884372@qq.com

## License

YYExtentions is available under the MIT license. See the LICENSE file for more info.
