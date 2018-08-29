//  Created by Songwen Ding on 2017/1/12.
//  Copyright © 2017年 Alex. All rights reserved.

import Foundation

open class HookObject: NSObject {
    var block:(() -> Void)?
    @objc open func function() {
        self.block?()
    }
}

extension NSObject {
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

extension NSString {
    public func match(regex: String) -> Bool {
        return (self as String) =~ regex
    }
}

extension NSString {
     public final var isPRCMobileNumber: Bool {
        return (self as String).isPRCMobileNumber
    }
     public final var isPRCIDNumber: Bool {
        return (self as String).isPRCIDNumber
    }
}

extension NSArray {
     public final var jsonData: Data? {
        return (self as Array).jsonData
    }
}

extension NSLocale {
     public class var perferredIdentifier: String? {
        set { Locale.perferredIdentifier = newValue }
        get { return Locale.perferredIdentifier }
    }
}

extension NSObject {
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

extension NSString {
     public final var jsonDictionary: [String: Any]? {
        return (self as String).jsonDictionary
    }
     public final var urlDictionary: [String: Any] {
        return (self as String).urlDictionary
    }
}

#if os(iOS)
extension NSArray {
     public func verticalImage(space: CGFloat, backgroundColor: UIColor?) -> UIImage? {
        return (self as? [UIImage])?.verticalImage(space: space, backgroundColor: backgroundColor)
    }
     public var verticalImage: UIImage? {
        return (self as? [UIImage])?.verticalImage
    }
}
#endif
