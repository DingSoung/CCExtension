//
//  String+Tools.swift
//
//
//  Created by Cuicui2 on 15/5/26.
//
//

/// switch two same type value
public func swep<T>(inout a:T, inout b:T) {
    let temp = a
    a = b
    b = temp
}

/// code Block, used like C block { }
public func closure(mark:String? = "", run:Bool? = true, block:()->Void, complete:(()->Void)? = {()->Void in}) {
    if run != true {
        return
    } else {
        block()
        complete?()
        print("执行完毕:\(mark)")
    }
}

/// code Block, used like C block { }
public func closure(block:()->Void) {
    closure(block: block, complete: nil)
}
