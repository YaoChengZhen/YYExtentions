//
//  YProtocolExtension.swift
//  Extensions
//
//  Created by bruce yao on 2019/7/22.
//  Copyright © 2019 bruce yao. All rights reserved.
//

import UIKit

func LZCoulorFromHexSwift(rgb: NSInteger) -> UIColor {
    return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                   alpha: 1.0)
}

//协议扩展
protocol YExtensionProtocol {
    associatedtype YExtensionType
    var value: YExtensionType { get }
}
//BackDefaultColor
extension YExtensionProtocol {
    var defalutColor: UIColor {
        return LZCoulorFromHexSwift(rgb: 0xffffff)
    }
}

///Struct的扩展基础
struct YExtensionKitStructEncodable<T>: YExtensionProtocol {
    var value: T
    typealias YExtensionType = T
    /// 构造方法
    init(kit: T) {
        self.value = kit
    }
}
