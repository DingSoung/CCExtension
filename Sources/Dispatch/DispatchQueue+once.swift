//  Created by Songwen on 2018/7/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Dispatch)
import Dispatch

extension DispatchQueue {
    private static var _onceTracker = [String]()

    /// excuse on current thread once
    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}

extension DispatchQueue {
    /// excuse on current thread once
    public class func once(file: String = #file, function: String = #function, line: Int = #line, block: () -> Void) {
        let token = file + ":" + function + ":" + String(line)
        self.once(token: token, block: block)
    }
}
#endif
