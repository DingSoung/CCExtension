//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

import Foundation

/// print log with detail message
public func print(log: Any,
                  file: String = #file,
                  line: Int = #line,
                  function: String = #function) {
    print([
        "thread":Thread.current,
        "file":file,
        "line":line,
        "function":function,
        "message":log,
        "callstack":Thread.callStackSymbols,
        ])
}

/// code Block, used like C code block { }
public func closure(mark:String? = "", run:Bool? = true, block:()->Void, complete:(()->Void)? = {()->Void in}) {
    if run != true {
        return
    } else {
        if let mk = mark {
            print("excode block \(mk)")
        }
        block()
        complete?()
        if let mk = mark {
            print("excode block \(mk) finished")
        }
    }
}

/// code Block, used like C block { }
public func closure(block:()->Void) {
    closure(block: block, complete: nil)
}

/// keep lock syncronized when run closure http://swifter.tips/lock/
public func synchronized(lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}
