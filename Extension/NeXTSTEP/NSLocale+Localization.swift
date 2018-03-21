//
//  NSLocale+Localization.swift
//  Extension
//
//  Created by Songwen Ding on 2018/3/21.
//  Copyright © 2018年 DingSoung. All rights reserved.
//

import Foundation

public extension NSLocale {
    /// app language code: en, zh, zh-Hans, zh-Hans-HK etc.
    public var forceLocale: String? {
        return Locale.current.forceLocale
    }
    public func setForceLocale(locale: String?) {
        Locale.current.setForceLocale(locale: locale)
    }
}
