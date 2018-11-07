//  Created by Songwen Ding on 2017/8/14.
//  Copyright © 2017年 DingSoung. All rights reserved.
#if canImport(Foundation)
import Foundation.NSLocale
import Foundation.NSUserDefaults

extension Locale {
    private static let perferredIdentifierKey = "AppleLanguages"
    /// app language code: en, zh, zh-Hans, zh-Hans-HK etc.
    public static var perferredIdentifier: String? {
        set {
            if let value = newValue {
                UserDefaults.standard.set([value], forKey: Locale.perferredIdentifierKey)
            } else {
                UserDefaults.standard.removeObject(forKey: Locale.perferredIdentifierKey)
            }
            UserDefaults.standard.synchronize()
        }
        get {
            return Locale.preferredLanguages.first ?? Locale.current.identifier
        }
    }
}
#endif
