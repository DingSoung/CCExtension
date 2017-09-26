//
//  NSURL+Cookie.swift
//  Extension
//
//  Created by Songwen Ding on 2017/11/23.
//  Copyright © 2017年 DingSoung. All rights reserved.
//

import Foundation

@objc
public extension NSURL {
    public func setCookie(value: String, forName name: String) {
        (self as URL).setCookie(value: value, forName: name)
    }
}
