//
//  WJLocalization.swift
//  DEMO
//
//  Created by Songwen Ding on 7/6/16.
//  Copyright © 2016 Songwen Ding. All rights reserved.
//

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

public extension Bundle {
    
    private struct AssociatedKeys{
        static var languageCode = "languageCode"
    }
    
    // bundle run time code en, zh_Hans ect, to update localization source without restart
    public var localizationCode:String? {
        set {
            if let path = self.path(forResource: newValue, ofType: "lproj") {
                if self.isMember(of: Bundle.self) {
                    object_setClass(self, BundleEx.self);
                }
                let runTimeBundle = Bundle(path: path)
                objc_setAssociatedObject(self, &AssociatedKeys.languageCode, runTimeBundle, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                if self.isMember(of: BundleEx.self) {
                    object_setClass(self, Bundle.self);
                }
                objc_removeAssociatedObjects(self)
            }
        }
        get {
            return self.preferredLocalizations.first
        }
    }
    
    fileprivate var runTimeBundle: Bundle? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.languageCode) as? Bundle
        }
    }
}

private class BundleEx: Bundle {
    private override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = self.runTimeBundle {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}





