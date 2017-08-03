//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

/*
 refer http://swifter.tips/regex/
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

infix operator =~: AdditionPrecedence
fileprivate struct RegexHelper {
    let regex: NSRegularExpression
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern,
                                        options: .caseInsensitive)
    }
    func match(input: String) -> Bool {
        let matches = regex.matches(in: input,
                                    options: [],
                                    range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
}

extension String {
    static func =~(str: String, regex: String) -> Bool {
        do {
            return try RegexHelper(regex).match(input: str as String)
        } catch _ {
            return false
        }
    }
    public func match(regex:String) -> Bool {
        return self =~ regex
    }
}

extension String {
    /// check is mobile phone number
    public var isPRCMobileNumber: Bool {
        //前缀0 86 17951 或者没有  中间13* 15* 17* 145 147 后加8个0～9的数
        return self =~ "^(0|86|086|17951)?1(3[0-9]|4[57]|7[0-9]|8[0123456789])[0-9]{8}$"
    }
    
    /// check is ID if People's Republic of China
    public var isPRCIDNumber: Bool {
        return self =~ "^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$" || self =~ "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2))(([0|1|2]\\d)|2[0-1])\\d{4}$"
    }
}
