//
//  Appdelegate+EventTrack.swift
//  DEMO
//
//  Created by Songwen Ding on 10/28/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

/*
extension UIButton {
    class func xxx_swizzleSendAction() {
        
        let cls: AnyClass! = UIButton.self
        
        let originalSelector = #selector(sendAction)
        let swizzledSelector = #selector(xxx_swizzleSendAction)
        
        let originalMethod =
            class_getInstanceMethod(cls, originalSelector)
        let swizzledMethod =
            class_getInstanceMethod(cls, swizzledSelector)
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
        
    }
    
    public func xxx_sendAction(action: Selector,
                               to: AnyObject!,
                               forEvent: UIEvent!)
    {
        struct xxx_buttonTapCounter {
            static var count: Int = 0
        }
        
        xxx_buttonTapCounter.count += 1
        print(xxx_buttonTapCounter.count)
        xxx_sendAction(action: action, to: to, forEvent: forEvent)
    }
}

extension UIButton {
    override open class func initialize() {
        if self != UIButton.self {
            return
        }
        UIButton.xxx_swizzleSendAction()
    }
}
 */

/*
extension UIResponder {
    open override class func initialize() {
        if self != UIResponder.self {
            return
        }
        //object_setClass(self, UIResponderEx.self)
    }
}

class UIResponderEx: UIResponder {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(touches) \(event)")
    }
}
*/


/*
public extension UIApplication {
    
    override open class func initialize() {
        if self != UIApplication.self {
            return
        }
        //object_setClass(self, UIApplicationEX.self)
        //UIApplication.setEvent(enable: true)
    }
    
    open func hook_sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("-----------hook-------\(action) \(target) \(sender) \(event)")
        return self.sendAction(action, to: target, from: sender, for: event)
    }
    
    open func swizzledSendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("\(action) \(target) \(sender) \(event)")
        return self.sendAction(action, to: target, from: sender, for: event)
    }
    
    
    
    
    
    
    
    open func myDescription() -> NSString {
        return "hooked   --------\(self.description)" as NSString
    }
    
    class func configHook(enable:Bool) {
//        let cls: AnyClass = UIApplication.self
//        let originalSelector = #selector(sendAction(_:to:from:for:))
//        let swizzledSelector = #selector(swizzledSendAction(_:to:from:for:))
//        
//        let originalMethod = class_getInstanceMethod(cls, originalSelector)
//        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
//        
//        method_exchangeImplementations(originalMethod, swizzledMethod)
        
        
        var method: Method = class_getInstanceMethod(object_getClass(self), Selector("description"))
        print(self.description) // Check original description
        
        var swizzledMethod: Method = class_getInstanceMethod(object_getClass(self), Selector("myDescription"))
        method_exchangeImplementations(method, swizzledMethod)
        
        print(self.description) //Check that swizzling works
    }
}
*/








/*

public extension UIApplication {
 
    override open class func initialize() {
        if self != UIApplication.self {
            return
        }
        //object_setClass(self, UIApplicationEX.self)
        //UIApplication.setEvent(enable: true)
    }
 
    dynamic func swizzledSendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("\(action) \(target) \(sender) \(event)")
        return self.sendAction(action, to: target, from: sender, for: event)
    }
    
    class func setEvent(enable:Bool) {
        let cls: AnyClass = UIApplication.self
        
        let originalSelector = #selector(sendAction(_:to:from:for:))
        let swizzledSelector = #selector(swizzledSendAction(_:to:from:for:))
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
        
        let didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if enable == didAddMethod {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
}

class UIApplicationEX: UIApplication {
    override func sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("\(action) \(target) \(sender) \(event)")
        return super.sendAction(action, to: target, from: sender, for: event)
    }
}
 */

