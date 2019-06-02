//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSThread

public enum LogLevel: String {
    case info, debug, warning, error, exception
}

fileprivate extension LogLevel {
    var symbol: String {
        switch self {
        case .info: return "\u{0001F538}"
        case .debug: return "\u{0001F539}"
        case .warning: return "\u{26A0}\u{FE0F}"
        case .error: return "\u{0001F6AB}"
        case .exception: return "\u{2757}\u{FE0F}"
        }
    }
}

/// log with detail message
@discardableResult
public func print(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) -> [Any] {
    let messages: [Any] = [logLevel.symbol, logLevel.rawValue, CFAbsoluteTimeGetCurrent(), "⇨",
                           file, line, function,
                           items]
    switch logLevel {
    case .info, .debug, .warning:
        #if DEBUG
        print(messages)
        #endif
    case .error, .exception:
        print(messages + [Thread.current, Thread.callStackSymbols])
    }
    return messages
}

@discardableResult
public func info(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) -> Any {
    return print(items, file: file, line: line, function: function, logLevel: .info)
}

@discardableResult
public func debug(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) -> Any {
    return print(items, file: file, line: line, function: function, logLevel: .debug)
}

@discardableResult
public func warning(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) -> Any {
    return print(items, file: file, line: line, function: function, logLevel: .warning)
}

@discardableResult
public func error(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) -> Any {
    return print(items, file: file, line: line, function: function, logLevel: .error)
}

@discardableResult
public func exception(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) -> Any {
    return print(items, file: file, line: line, function: function, logLevel: .exception)
}

#endif
