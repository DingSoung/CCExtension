//  Created by Songwen on 2018/7/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Dispatch)
import Dispatch

extension DispatchQueue {
    private static var _onceTracker = [String]()

    public func once(file: String = #file, function: String = #function, line: Int = #line, block: () -> Void) {
        let token = file + ":" + function + ":" + String(line)
        self.once(token: token, block: block)
    }

    public func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if DispatchQueue._onceTracker.contains(token) {
            return
        }
        DispatchQueue._onceTracker.append(token)
        block()
    }
}
#endif
