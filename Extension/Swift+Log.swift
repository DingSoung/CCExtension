//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

import Foundation

/// print log with detail message
@discardableResult public func log(messgae: Any?,
                                   file: String = #file,
                                   line: Int = #line,
                                   function: String = #function,
                                   debug: Bool? = false) -> [String : Any] {
    let dict = [
        "message" : messgae ?? "None",
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
