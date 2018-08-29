//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

import Foundation

/// log with detail message
@discardableResult public func log(_ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function) -> [Any] {
    return items + [file, line, function, Thread.current, Thread.callStackSymbols]
}
