//  Created by Songwen Ding on 2017/7/26.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

/// code Block, used like C code block { }
public func closure(mark:String? = "", run:Bool? = true, block:()->Void, complete:(()->Void)? = {}) {
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
