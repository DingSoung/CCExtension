//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

import Foundation

/// print log with detail message
@discardableResult
public func pring(log: Any?,
                  debug: Bool? = false,
                  file: String = #file,
                  line: Int = #line,
                  function: String = #function) -> [String : Any] {
    let dict = [
        "log" : log ?? "None",
        "file" : file,
        "line" : line,
        "function" : function,
        "thread" : Thread.current,
        "callstack" : Thread.callStackSymbols,
        ]
    if let dbg = debug, dbg == true {
        print(dict)
    }
    return dict
}
