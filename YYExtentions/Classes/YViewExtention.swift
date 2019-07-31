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
    ///设置centerX
    func setCenterX(_ newValue: CGFloat) -> Void {
        value.center = CGPoint.init(x: newValue, y: centerY)
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
    ///设置centerY
    func setCenterY(_ newValue: CGFloat) -> Void {
        value.center = CGPoint.init(x: centerX, y: newValue)
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
    ///设置origin  X
    func setOriginX(_ newValue: CGFloat) -> Void {
        value.frame.origin = CGPoint.init(x: newValue, y: originY)
    }
    
    
    ///origin  Y
    var originY: CGFloat {
        get {
            return value.frame.origin.y
        }
    }
    
    ///设置origin  Y
    func setOriginY(_ newValue: CGFloat) -> Void {
        value.frame.origin = CGPoint.init(x: originX, y: newValue)
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
    
    ///设置View的宽
    func setWidth(_ newValue: CGFloat) -> Void {
        value.frame.size = CGSize.init(width: newValue, height: height)
    }
    
    ///View高
    var height: CGFloat {
        get {
            return value.bounds.size.height
        }
    }
    ///设置View的高
    func setHeight(_ newValue: CGFloat) -> Void {
        value.frame.size = CGSize.init(width: width, height: newValue)
    }
}

//MARK:View圆角扩展
public extension YExtensionProtocol where YExtensionType == UIView {
    
    ///设置圆角
    func drawRounds(round: CGFloat) -> Void {
        let path = UIBezierPath.init(roundedRect: value.bounds, cornerRadius: round)
        let layerSharpe = CAShapeLayer.init()
        layerSharpe.path = path.cgPath
        layerSharpe.frame = value.bounds
        value.layer.mask = layerSharpe
    }
    ///设置圆角。四个角那几个设置
    func drawRounds(corners: UIRectCorner, round: CGFloat) -> Void {
        let path = UIBezierPath.init(roundedRect: value.bounds, byRoundingCorners: corners, cornerRadii: CGSize.init(width: round, height: round))
        let layerSharpe = CAShapeLayer.init()
        layerSharpe.path = path.cgPath
        layerSharpe.frame = value.bounds
        value.layer.mask = layerSharpe
    }
}

//MARK: UIViewExtension
public extension UIView {
    var yy_kit: YExtensionKitStructEncodable<UIView> {
        return YExtensionKitStructEncodable.init(kit: self)
    }
}

//#endif
