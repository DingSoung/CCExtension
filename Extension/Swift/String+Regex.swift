//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

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
    public func match(regex: String) -> Bool {
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
        return self =~ "^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$"
            || self =~ "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2))(([0|1|2]\\d)|2[0-1])\\d{4}$"
    }
}
