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
}


