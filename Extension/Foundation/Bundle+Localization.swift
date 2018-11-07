//  Created by Songwen Ding on 7/6/16.
//  Copyright © 2016 Songwen Ding. All rights reserved.

#if canImport(Foundation)
import Foundation.NSBundle
import ObjectiveC.objc_api

extension Bundle {
    private struct AssociatedKeys {
        static var languageCode = "languageCode"
    }
    // bundle run time code en, zh_Hans ect, to update localization source without restart
    public var localizationCode: String? {
        set {
            if let path = self.path(forResource: newValue, ofType: "lproj") {
                if self.isMember(of: Bundle.self) {
                    object_setClass(self, BundleEx.self)
                }
                let runTimeBundle = Bundle(path: path)
                objc_setAssociatedObject(self,
                                         &AssociatedKeys.languageCode,
                                         runTimeBundle,
                                         objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                if self.isMember(of: BundleEx.self) {
                    object_setClass(self, Bundle.self)
                }
                objc_removeAssociatedObjects(self)
            }
        }
        get {
            return self.preferredLocalizations.first
        }
    }
    fileprivate var runTimeBundle: Bundle? {
        return objc_getAssociatedObject(self, &AssociatedKeys.languageCode) as? Bundle
    }
}

private class BundleEx: Bundle {
    fileprivate override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = self.runTimeBundle {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}
#endif
