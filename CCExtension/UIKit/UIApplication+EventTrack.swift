//  Created by Songwen Ding on 10/28/16.
//  Copyright © 2016 Alex. All rights reserved.

import UIKit

extension UIApplication {
    
    override open class func initialize() {
        if self != UIApplication.self {
            return
        }
        //self.switchHook()
    }
    
    open func hook_sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("\n\(action)\n\(target)\n\(sender)\n\(event)")
        return self.hook_sendAction(action, to: target, from: sender, for: event)
    }
    
    public final class func switchHook() {
        let cls: AnyClass = UIApplication.self
        let originalSelector = #selector(sendAction(_:to:from:for:))
        let swizzledSelector = #selector(hook_sendAction(_:to:from:for:))
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
        
        if class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)) {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
            print("Application SendAction Hooked")
        }
    }
}

