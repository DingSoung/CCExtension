//  Created by Songwen Ding on 2017/7/26.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

/// keep lock syncronized when run closure http://swifter.tips/lock/
public func synchronized(lock: AnyObject, closure: () -> Void ) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}
