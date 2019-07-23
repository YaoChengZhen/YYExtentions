//
//  YDateExtention.swift
//  Extensions
//
//  Created by bruce yao on 2019/7/22.
//  Copyright © 2019 bruce yao. All rights reserved.
//
//#if os(iOS) || os(tvOS)

import UIKit

//MARK:日期的一些操作
public extension YExtensionProtocol where YExtensionType == Date {
    /// 获取当前 秒级 时间戳 - 10位
    var timeStamp: String {
        let timeInterval: TimeInterval = value.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        return "\(timeStamp)"
    }
    
    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp: String {
        let timeInterval: TimeInterval = value.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
}

//MARKL: Date扩展属性
public extension Date {
    var yy_kit: YExtensionKitStructEncodable<Date> {
        return YExtensionKitStructEncodable.init(kit: self)
    }
}
//#endif
