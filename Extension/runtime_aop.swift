//  Created by Songwen Ding on 2018/5/8.
//  Copyright © 2018年 DingSoung. All rights reserved.

import Foundation

public func aop(originClass: AnyClass, originSelector: Selector,
                newClass: AnyClass, newSelector: Selector) {
    guard let originalMethod = class_getInstanceMethod(originClass, originSelector),
        let newMethod = class_getInstanceMethod(newClass, newSelector)
        else { return }
    let hasMethod = class_addMethod(originClass,
                                    originSelector,
                                    method_getImplementation(newMethod),
                                    method_getTypeEncoding(newMethod))
    if hasMethod {
        class_replaceMethod(originClass,
                            originSelector,
                            method_getImplementation(newMethod),
                            method_getTypeEncoding(newMethod))
    } else {
        method_exchangeImplementations(originalMethod, newMethod)
    }
}
