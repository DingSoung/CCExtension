//  Created by Songwen Ding on 10/28/16.
//  Copyright © 2016 Alex. All rights reserved.

import UIKit

extension UIApplication {
    
    @objc open func hook_sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("\n\(action)\n\(String(describing: target))\n\(String(describing: sender))\n\(String(describing: event))")
        return self.hook_sendAction(action, to: target, from: sender, for: event)
    }
    
    public final class func switchHook() {
        let originalSelector = #selector(UIApplication.sendAction(_:to:from:for:))
        let swizzledSelector = #selector(UIApplication.hook_sendAction(_:to:from:for:))
        let originalMethod = class_getInstanceMethod(UIApplication.self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(UIApplication.self, swizzledSelector)
        
        if class_addMethod(UIApplication.self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(UIApplication.self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
            print("Application SendAction reseted")
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
            print("Application SendAction Hooked")
        }
    }
}

