//  Created by Songwen Ding on 2017/7/26.
//  Copyright © 2017年 DingSoung. All rights reserved.

/// keep lock syncronized when run closure http://swifter.tips/lock/

#if canImport(ObjectiveC)
import ObjectiveC.objc_sync

public func synchronized(lock: AnyObject, closure: () -> Void ) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}
#endif
