//
//  NSString+Tools.swift
//  DEMO
//
//  Created by Songwen Ding on 12/15/15.
//  Copyright © 2015 DingSoung. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

extension NSString {
    
    /// String to Dictionary
    public var jsonDict: NSDictionary {
        guard let JsonData = self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) else {
            return [String: String]()
        }
        do {
            if let JSONDictionary = try NSJSONSerialization.JSONObjectWithData(JsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                return JSONDictionary
            } else {
                return [String: String]()
            }
        } catch {
            return [String: String]()
        }
    }
    
    /// url format to Dictionary
    public var urlToDict: NSDictionary {
        let dict = NSMutableDictionary()
        let params = self.componentsSeparatedByString("&")
        for param in params {
            let strs = param.componentsSeparatedByString("=")
            if strs.count >= 2 {
                if let value = strs[1].stringByRemovingPercentEncoding {
                    dict.setValue(value, forKey: strs[0])
                } else {
                    print("un-resolve key:\(strs[0]) value:\(strs[1])")
                }
            } else {
                print("un-resolve strs \(strs)")
            }
        }
        return dict
    }
    
    /// count lenght of String, one Chinese, Japanese etcis 2
    public var lenghtOfZhEn: Int {
        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
        guard let da = self.dataUsingEncoding(enc) else {
            return 0
        }
        return da.length
    }
    
    
    /// height for limit width with font
    public func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
    
    /// width for limit height with font
    public func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.max, height: height)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.width
    }
    
    /// check is mobile phone number
    public var isPRCMobileNumber: Bool {
        //前缀0 86 17951 或者没有  中间13* 15* 17* 145 147 后加8个0～9的数
        let format = NSPredicate(format: "SELF MATCHES %@", "^(0|86|086|17951)?1(3[0-9]|4[57]|7[0-9]|8[0123456789])[0-9]{8}$")
        return format.evaluateWithObject(self)
    }
    
    /// check is ID if People's Republic of China
    public var isPRCIDNumber: Bool {
        let format1 = NSPredicate(format: "SELF MATCHES %@", "^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$")
        let format2 = NSPredicate(format: "SELF MATCHES %@", "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2))(([0|1|2]\\d)|2[0-1])\\d{4}$")
        return format1.evaluateWithObject(self) || format2.evaluateWithObject(self)
    }
    
    /*
     提取信息中的网络链接:(h|H)(r|R)(e|E)(f|F) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)?
     提取信息中的邮件地址:\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
     提取信息中的图片链接:(s|S)(r|R)(c|C) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)?
     提取信息中的IP地址:(\d+)\.(\d+)\.(\d+)\.(\d+)
     提取信息中的中国手机号码:(86)*0*13\d{9}
     提取信息中的中国固定电话号码:(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}
     提取信息中的中国电话号码（包括移动和固定电话）:(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}
     提取信息中的中国邮政编码:[1-9]{1}(\d+){5}
     提取信息中的中国身份证号码:\d{18}|\d{15}
     提取信息中的整数：\d+
     提取信息中的浮点数（即小数）：(-?\d*)\.?\d+
     提取信息中的任何数字 ：(-?\d*)(\.\d+)?
     提取信息中的中文字符串：[\u4e00-\u9fa5]*
     提取信息中的双字节字符串 (汉字)：[^\x00-\xff]*
     */
}
