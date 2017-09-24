//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

import Foundation

/// log with detail message
@discardableResult
public func log(_ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function) -> [Any] {
    return items + [file, line, function, Thread.current, Thread.callStackSymbols]
}

public func print(_ items: Any..., separator: String =  " ", terminator: String = "\n",
                  file: String = #file, line: Int = #line, function: String = #function) {
    print(items, separator: separator, terminator: terminator)
    debugPrint(file, line, function, Thread.current, Thread.callStackSymbols,
               separator: separator,
               terminator: terminator)
}
