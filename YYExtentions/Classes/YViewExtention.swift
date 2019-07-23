//
//  YViewExtention.swift
//  Extensions
//
//  Created by bruce yao on 2019/7/22.
//  Copyright © 2019 bruce yao. All rights reserved.
//
//#if os(iOS) || os(tvOS)

import UIKit

//MARK:UIView frame
public extension YExtensionProtocol where YExtensionType == UIView {
    ///中心点X
    var centerX: CGFloat {
        get {
            return value.center.x
        }
        set(x) {
            value.center = CGPoint.init(x: x, y: centerY)
        }
    }
    
    ///中心点Y
    var centerY: CGFloat {
        get {
            return value.center.y
        }
        set(y) {
            value.center = CGPoint.init(x: centerX, y: y)
        }
    }
    
    ///origin  X
    var originX: CGFloat {
        get {
            return value.frame.origin.x
        }
        set(x) {
            value.frame.origin = CGPoint.init(x: x, y: originY)
        }
    }
    ///origin  Y
    var originY: CGFloat {
        get {
            return value.frame.origin.y
        }
        set(y) {
            value.frame.origin = CGPoint.init(x: originX, y: y)
        }
    }
    
    ///View宽
    var width: CGFloat {
        get {
            return value.bounds.size.width
        }
        set(width) {
            value.frame.size = CGSize.init(width: width, height: height)
        }
    }
    ///View高
    var height: CGFloat {
        get {
            return value.bounds.size.height
        }
        set(height) {
            value.frame.size = CGSize.init(width: width, height: height)
        }
    }
}

//MARK: UIViewExtension
public extension UIView {
    var yy_kit: YExtensionKitStructEncodable<UIView> {
        return YExtensionKitStructEncodable.init(kit: self)
    }
}

//#endif
