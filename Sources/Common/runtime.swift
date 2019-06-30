//  Created by Songwen Ding on 2018/5/8.
//  Copyright © 2018年 DingSoung. All rights reserved.

#if canImport(ObjectiveC)
import ObjectiveC
import Foundation

/// dynamic add selector for classes; int *countOfNumbers(_ numbers: [int])  i@:[i];
public func selector(uid: String, types: String, classes: [AnyClass], block: (() -> Swift.Void)?) -> Selector {
    let aSelector = NSSelectorFromString(uid)
    let block = { () -> Swift.Void in block?() }
    let castedBlock: AnyObject = unsafeBitCast(block as @convention(block) () -> Swift.Void, to: AnyObject.self)
    let imp = imp_implementationWithBlock(castedBlock)
    classes.forEach({ (cls) in
        if class_addMethod(cls, aSelector, imp, UnsafeMutablePointer(mutating: types)) {
        } else { class_replaceMethod(cls, aSelector, imp, UnsafeMutablePointer(mutating: types)) }
    })
    return aSelector
}

@discardableResult public func add(_ selector: Selector, in cls: AnyClass, to target: AnyClass) -> Bool {
    guard let method = class_getInstanceMethod(cls, selector) else { return false}
    let imp = method_getImplementation(method)
    let types = method_getTypeEncoding(method)
    return class_addMethod(target.self, selector, imp, types)
}

@discardableResult
public func replace(_ selector1: Selector, in  cls1: AnyClass, with seletor2: Selector, in cls2: AnyClass) -> Bool {
    guard let method = class_getInstanceMethod(cls2, seletor2) else { return false }
    let imp = method_getImplementation(method)
    let types = method_getTypeEncoding(method)
    if class_addMethod(cls1, selector1, imp, types) {
    } else { class_replaceMethod(cls1, selector1, imp, types) }
    return true
}

@discardableResult
public func exchange(_ selector1: Selector, in  cls1: AnyClass, with selector2: Selector, in cls2: AnyClass) -> Bool {
    guard let method2 = class_getInstanceMethod(cls2, selector2) else { return false }
    let imp2 = method_getImplementation(method2)
    let types2 = method_getTypeEncoding(method2)
    if class_addMethod(cls1, selector1, imp2, types2) {
        //class_replaceMethod(cls1, selector1, imp2, types2)
        return true
    } else {
        guard let method1 = class_getInstanceMethod(cls1, selector1) else { return false }
        method_exchangeImplementations(method1, method2)
        return true
    }
}

/// get all method infos in class
public func methods(cls: AnyClass) -> [(Any)] {
    var methodCount: UInt32 = 0
    let methodList = class_copyMethodList(cls.self, &methodCount)
    var ret = [(Any)]()
    for index in 0..<methodCount {
        guard let temp = methodList?[Int(index)] else { continue }
        let set = (
            method_getName(temp),
            method_getNumberOfArguments(temp),
            String(describing: method_getTypeEncoding(temp)),
            method_getImplementation(temp),
            sel_getName(method_getName(temp))
        )
        ret.append(set)
    }
    return ret
}

/// check is a class has a selector
public func existSelector(selector: Selector, cls: AnyClass) -> Bool {
    var methodCount: UInt32 = 0
    let methodList = class_copyMethodList(cls.self, &methodCount)
    for index in 0..<methodCount {
        guard let temp = methodList?[Int(index)] else { continue }
        if NSStringFromSelector(method_getName(temp)) == NSStringFromSelector(selector) {
            return true
        }
    }
    return false
}

#endif
