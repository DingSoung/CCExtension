//  Created by Songwen Ding on 7/6/16.
//  Copyright © 2016 Songwen Ding. All rights reserved.

import Foundation

public extension NSObject {
    /// app language code: en, zh_Hans etc.
    public class var languageCode:String? {
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





