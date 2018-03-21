//  Created by Songwen Ding on 2017/8/14.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

public extension Locale {
    private static let appForceLocaleKey = "AppleLanguages"
    /// app language code: en, zh, zh-Hans, zh-Hans-HK etc.
    public var forceLocale: String? {
        return (UserDefaults.standard.object(forKey: Locale.appForceLocaleKey) as? [String])?.first
            ?? Locale.current.identifier
    }
    public func setForceLocale(locale: String?) {
        if let value = locale {
            UserDefaults.standard.set([value], forKey: Locale.appForceLocaleKey)
        } else {
            UserDefaults.standard.removeObject(forKey: Locale.appForceLocaleKey)
        }
        UserDefaults.standard.synchronize()
    }
}
