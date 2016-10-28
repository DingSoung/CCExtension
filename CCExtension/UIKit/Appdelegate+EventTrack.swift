//
//  Appdelegate+EventTrack.swift
//  DEMO
//
//  Created by Songwen Ding on 10/28/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

public extension UIApplication {
    @objc func swizzledSendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("\(action) \(target) \(sender) \(event)")
        return self.sendAction(action, to: target, from: sender, for: event)
    }
    
    public func setEvent(enable:Bool) {
        let originalSelector = #selector(UIApplication.sendAction(_:to:from:for:))
        let swizzledSelector = #selector(UIApplication.swizzledSendAction(_:to:from:for:))
        
        let originalMethod = class_getInstanceMethod(UIApplication.self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(UIApplication.self, swizzledSelector)
        
        let didAddMethod = class_addMethod(UIApplication.self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if enable == didAddMethod {
            class_replaceMethod(UIApplication.self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
