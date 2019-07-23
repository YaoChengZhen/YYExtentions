//
//  YStringExtention.swift
//  Extensions
//
//  Created by bruce yao on 2019/7/22.
//  Copyright © 2019 bruce yao. All rights reserved.
//

import UIKit
import CommonCrypto

/**
 只要是不是传参数的都可以用属性来解决
 */
//MARK:String 扩展有关路径path扩展
extension YExtensionProtocol where YExtensionType == String {
    ///路径：http://www/ff.txt 结果：ff.txt
    internal var lastPathComponent: String {
        get {
            return NSString.init(string: value).lastPathComponent
        }
    }
    
    ///获取后缀类型
    internal var pathExtension: String {
        get {
            return NSString.init(string: value).pathExtension
        }
    }
    ///删除路径扩展
    internal var deletePathExtension: String {
        get {
            return NSString.init(string: value).deletingPathExtension
        }
    }
}

//MARK:String-MD5加密32位
extension YExtensionProtocol where YExtensionType == String {
    ///MD5加密32位小写
    internal var toMd5Lower: String {
        let str = value.cString(using: .utf8)
        let strLen = CUnsignedInt(value.lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString.init()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count: digestLen)
        return String(hash)
    }
    ///MD5加密32位大写
    var toMd5Upper: String {
        let str = value.cString(using: .utf8)
        let strLen = CUnsignedInt(value.lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02X", result[i])
        }
        result.deinitialize(count: digestLen)
        return String(hash)
    }
}

//MARK:String-宽高计算
extension YExtensionProtocol where YExtensionType == String {
    ///宽度给定、字体给定：算出高度
    func yy_getMaxHeight(font: UIFont, width: CGFloat) -> CGFloat {
        let size = CGSize.init(width: width, height: CGFloat(MAXFLOAT))
        return getMaxHeight(font: font, rangeRect: size)
    }
    ///高度给定、字体给定：算出宽度
    func yy_getMaxWidth(font: UIFont, height: CGFloat) -> CGFloat {
        let size = CGSize.init(width: CGFloat(MAXFLOAT), height: height)
        return getMaxHeight(font: font, rangeRect: size)
    }
    
    fileprivate func getMaxHeight(font: UIFont, rangeRect rect: CGSize) -> CGFloat {
        let opt: NSStringDrawingOptions = [NSStringDrawingOptions.truncatesLastVisibleLine, NSStringDrawingOptions.usesFontLeading, NSStringDrawingOptions.usesLineFragmentOrigin]
        let str = NSString.init(string: value)
        let maxSize = rect
        let attr:[NSAttributedString.Key: Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): font]
        let resultRect = str.boundingRect(with: maxSize, options: opt, attributes: attr, context: nil)
        // 返回高度
        return CGFloat(ceil(Double(resultRect.height)))
    }
    
    ///去除左右空格和换行符
    var trim: String {
        get {
            return value.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    /// 将16进制字符串转为Int
    var hexInt: Int {
        get {
            return Int(value, radix: 16) ?? 0
        }
    }
    
    ///解析html文本
    var parseHtmlText: NSMutableAttributedString? {
        var attrStr: NSMutableAttributedString?
        do {
            try attrStr = NSMutableAttributedString.init(data: value.data(using: .unicode, allowLossyConversion: true)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
            attrStr?.removeAttribute(NSAttributedString.Key.font, range: NSMakeRange(0, (attrStr?.length)!))
            let style = NSMutableParagraphStyle()
            style.lineBreakMode = .byTruncatingTail
            attrStr?.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, (attrStr?.length)!))
        } catch let err {
            print(err)
        }
        return attrStr
    }
}

//MARK:String-其他操作
extension YExtensionProtocol where YExtensionType == String {
    ///字符串包含
    func yy_has(string:String) -> Bool {
        return value.contains(string)
    }
    ///所在位置
    func yy_indexOf(string str:String) -> Int {
        var i = -1
        if let r = value.range(of: str) {
            if !r.isEmpty {
                i = value.distance(from: value.startIndex, to: r.lowerBound)
            }
        }
        return i
    }
}

//MARK:String-数据校验
extension YExtensionProtocol where YExtensionType == String {
    
    ///手机号校验
    var isMobile: Bool {
        get {
            let idRegex = "^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$"
            let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
            return idTest.evaluate(with: value)
        }
    }
    
    ///邮箱校验
    var isEmail: Bool {
        let idRegex = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
        return idTest.evaluate(with: value)
    }
    
    ///密码校验
    var isPassword: Bool {
        let idRegex = "^[a-zA-Z0-9]{6,20}+$"
        let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
        return idTest.evaluate(with: value)
    }
    
    ///URL校验
    var isURL: Bool {
        let idRegex = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
        let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
        return idTest.evaluate(with: value)
    }
    
    /// ip地址校验
    var isIP: Bool {
        get {
            let idRegex = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
            let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
            return idTest.evaluate(with: value)
        }
    }
    
    ///车牌号校验
    var isCarCard: Bool {
        get {
            let idRegex = "([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF])|([DF]([A-HJ-NP-Z0-9])[0-9]{4})))|([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1})"
            let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
            return idTest.evaluate(with: value)
        }
    }
    ///身份证校验
    var isIdNum: Bool {
        let idRegex = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let idTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
        return idTest.evaluate(with: value)
    }
}

//MARKL: Date扩展属性
public extension String {
    var yy_kit: YExtensionKitStructEncodable<String> {
        return YExtensionKitStructEncodable.init(kit: self)
    }
}
