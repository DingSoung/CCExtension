//
//  NSObject+HookBlock.swift
//  DEMO
//
//  Created by Songwen Ding on 2017/1/12.
//  Copyright © 2017年 Alex. All rights reserved.
//

import Foundation

open class HookObject: NSObject {
    var block:(()->Void)?
    @objc open func function() {
        self.block?()
    }
}

extension NSObject {
    public class func hook(cls: Swift.AnyClass, originalSelector: Selector, option:Any, block:@escaping (()->Void)) {
        let hookObject = HookObject()
        hookObject.block = block
        
        let swizzledSelector = #selector(HookObject.function)
        
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        
        class_replaceMethod(HookObject.self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
    }
}
