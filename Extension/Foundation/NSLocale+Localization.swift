//  Created by Songwen Ding on 2017/8/14.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

public extension NSLocale {
    /// app language code: en, zh_Hans etc.
    public class var localizationCode:String? {
        set {
            if let value = newValue {
                UserDefaults.standard.set([value], forKey: "AppleLanguages")
            } else {
                UserDefaults.standard.removeObject(forKey: "AppleLanguages")
            }
            UserDefaults.standard.synchronize()
        }
        get {
            if let forceLanguageCode = (UserDefaults.standard.object(forKey: "AppleLanguages") as? [String])?.first {
                return forceLanguageCode
            } else {
                return NSLocale.current.identifier
            }
        }
    }
}
