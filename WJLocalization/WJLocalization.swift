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
                NSUserDefaults.standardUserDefaults().setObject([value], forKey: "AppleLanguages")
            } else {
                NSUserDefaults.standardUserDefaults().removeObjectForKey("AppleLanguages")
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        get {
            if let forceLanguageCode = (NSUserDefaults.standardUserDefaults().objectForKey("AppleLanguages") as? [String])?.first {
                return forceLanguageCode
            } else {
                return NSLocale.currentLocale().localeIdentifier
            }
        }
    }
}

public extension NSBundle {
    
    private struct AssociatedKeys{
        static var languageCode = "languageCode"
    }
    
    // bundle run time code en, zh_Hans ect, to update localization source without restart
    public var localizationCode:String? {
        set {
            if let path = self.pathForResource(newValue, ofType: "lproj") {
                if self.isMemberOfClass(NSBundle.self) {
                    object_setClass(self, BundleEx.self);
                }
                let runTimeBundle = NSBundle(path: path)
                objc_setAssociatedObject(self, &AssociatedKeys.languageCode, runTimeBundle, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                if self.isMemberOfClass(BundleEx.self) {
                    object_setClass(self, NSBundle.self);
                }
                objc_removeAssociatedObjects(self)
            }
        }
        get {
            return self.preferredLocalizations.first
        }
    }
    
    private var runTimeBundle: NSBundle? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.languageCode) as? NSBundle
        }
    }
}

private class BundleEx: NSBundle {
    private override func localizedStringForKey(key: String, value: String?, table tableName: String?) -> String {
        if let bundle = self.runTimeBundle {
            return bundle.localizedStringForKey(key, value: value, table: tableName)
        } else {
            return super.localizedStringForKey(key, value: value, table: tableName)
        }
    }
}





