//
//  YViewControllerExtention.swift
//  Extensions
//
//  Created by bruce yao on 2019/7/22.
//  Copyright © 2019 bruce yao. All rights reserved.
//
//#if os(iOS) || os(tvOS)

import UIKit

//MARK: UIViewControllerExtension
extension YExtensionProtocol where YExtensionType == UIViewController {
    
    ///navigation LeftButton is Image
    func addLeftBtn(imageName: String, action: @escaping BlockButtonAction) -> Void {
        let itemBtn = BlockButton.init(type: .custom)
        itemBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        itemBtn.setImage(UIImage.init(named: imageName), for: .normal)
        //        itemBtn.sizeToFit()
        itemBtn.addAction(action)
        value.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: itemBtn)
    }
    
    ///navigation LeftButton is title
    func addLeftBtn(_ title: String?, action: @escaping BlockButtonAction) -> Void {
        addLeftBtn(title, color: .black, action: action)
    }
    
    ///navigation LeftButton is  title and TitleColor
    func addLeftBtn(_ title: String?, color: UIColor?,  action: @escaping BlockButtonAction) -> Void {
        addLeftBtn(title, font: UIFont.systemFont(ofSize: 15), color: color, action: action)
    }
    
    ///navigation LeftButton is  title and TitleFont DefaultColor:black
    func addLeftBtn(_ title: String?, font: UIFont,  action: @escaping BlockButtonAction) -> Void {
        addLeftBtn(title, font: font, color: defalutColor, action: action)
    }
    
    ///导航栏左边添加标题:font,color
    func addLeftBtn(_ title: String?, font: UIFont, color: UIColor?, action: @escaping BlockButtonAction) -> Void {
        let itemBtn = BlockButton.init(type: .custom)
        itemBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        itemBtn.setTitle(title, for: .normal)
        itemBtn.titleLabel?.font = font
        itemBtn.setTitleColor(color, for: .normal)
        itemBtn.addAction(action)
        value.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: itemBtn)
    }
}
//MARK: UIViewController,右边返回按钮
extension YExtensionProtocol where YExtensionType == UIViewController {
    
    ///导航栏右边添加图片
    func addRightBtn(imageName: String, action: @escaping BlockButtonAction) -> Void {
        let itemBtn = BlockButton.init(type: .custom)
        itemBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        itemBtn.setImage(UIImage.init(named: imageName), for: .normal)
        //        itemBtn.sizeToFit()
        itemBtn.addAction(action)
        value.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: itemBtn)
    }
    
    ///导航栏右边添加标题
    func addRightBtn(_ title: String?, action: @escaping BlockButtonAction) -> Void {
        addRightBtn(title, color: .black, action: action)
    }
    
    ///导航栏左边添加标题:color
    func addRightBtn(_ title: String?, color: UIColor?,  action: @escaping BlockButtonAction) -> Void {
        addRightBtn(title, font: UIFont.systemFont(ofSize: 15), color: color, action: action)
    }
    
    ///导航栏左边添加标题:font,字体默认颜色是黑色：defalutColor
    func addRightBtn(_ title: String?, font: UIFont,  action: @escaping BlockButtonAction) -> Void {
        addRightBtn(title, font: font, color: defalutColor, action: action)
    }
    
    ///导航栏右边添加标题:font,color
    func addRightBtn(_ title: String?, font: UIFont, color: UIColor?, action: @escaping BlockButtonAction) -> Void {
        let itemBtn = BlockButton.init(type: .custom)
        itemBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        itemBtn.setTitle(title, for: .normal)
        itemBtn.titleLabel?.font = font
        itemBtn.setTitleColor(color, for: .normal)
        itemBtn.addAction(action)
        value.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: itemBtn)
    }
}

//MARKL: VC扩展属性
extension UIViewController {
    var yy_kit: YExtensionKitStructEncodable<UIViewController> {
        return YExtensionKitStructEncodable.init(kit: self)
    }
}

//#endif
