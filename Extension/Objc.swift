//  Created by Songwen Ding on 2017/1/12.
//  Copyright © 2017年 Alex. All rights reserved.

import Foundation

open class HookObject: NSObject {
    var block:(() -> Void)?
    @objc open func function() {
        self.block?()
    }
}

@objc extension NSObject {
    public class func hook(cls: Swift.AnyClass,
                           originalSelector: Selector,
                           option: Any, block: @escaping (() -> Void)) {
        let hookObject = HookObject()
        hookObject.block = block
        let swizzledSelector = #selector(HookObject.function)
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        class_replaceMethod(HookObject.self, swizzledSelector,
                            method_getImplementation(originalMethod!),
                            method_getTypeEncoding(originalMethod!))
    }
}

@objc extension NSString {
    public func match(regex: String) -> Bool {
        return (self as String) =~ regex
    }
}

@objc extension NSString {
     public final var isPRCMobileNumber: Bool {
        return (self as String).isPRCMobileNumber
    }
     public final var isPRCIDNumber: Bool {
        return (self as String).isPRCIDNumber
    }
}

@objc extension NSArray {
     public final var jsonData: Data? {
        return (self as Array).jsonData
    }
}

@objc extension NSURL {
     public func setCookie(value: String, forName name: String) {
        (self as URL).setCookie(value: value, forName: name)
    }
}

@objc extension NSDictionary {
     public final var jsonData: Data? {
        return (self as Dictionary).jsonData
    }
}

@objc extension NSLocale {
     public class var perferredIdentifier: String? {
        set { Locale.perferredIdentifier = newValue }
        get { return Locale.perferredIdentifier }
    }
}

@objc extension NSObject {
     public convenience init(JSONDict: [String: Any]) {
        self.init()
        self.setValuesForKeys(JSONDict)
    }
     public convenience init(JSONStr: String) {
        self.init()
        guard let data = JSONStr.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return }
        do {
            let json = try JSONSerialization.jsonObject(with: data,
                                                        options: JSONSerialization.ReadingOptions.mutableContainers)
            guard let dict = json as? [String: Any] else { return }
            self.setValuesForKeys(dict)
        } catch {
            debugPrint(error)
        }
    }
}

@objc extension NSString {
     public final var jsonDictionary: [String: Any]? {
        return (self as String).jsonDictionary
    }
     public final var urlDictionary: [String: Any] {
        return (self as String).urlDictionary
    }
}

@objc extension NSData {
     public final var jsonObject: Any? {
        return (self as Data).jsonObject
    }
     public final var jsonArray: [Any]? {
        return (self as Data).jsonArray
    }
     public final var jsonDictionary: NSDictionary? {
        return (self as Data).jsonDictionary as NSDictionary?
    }
     public final var jsonString: String? {
        return (self as Data).jsonString
    }
}

#if os(iOS)
@objc extension NSArray {
     public func verticalImage(space: CGFloat, backgroundColor: UIColor?) -> UIImage? {
        return (self as? [UIImage])?.verticalImage(space: space, backgroundColor: backgroundColor)
    }
     public var verticalImage: UIImage? {
        return (self as? [UIImage])?.verticalImage
    }
}
#endif
