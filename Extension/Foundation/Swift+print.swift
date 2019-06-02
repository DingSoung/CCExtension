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
public func print(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) {
    let fileName = URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
    let messages: [Any] = [
        logLevel.symbol, logLevel.rawValue, CFAbsoluteTimeGetCurrent(), "⇨",
        fileName, line, function,
        items
    ]
    switch logLevel {
    case .info, .debug, .warning:
        #if DEBUG
        messages.forEach { print($0) }
        #endif
    case .error, .exception:
        (messages + [Thread.current] + Thread.callStackSymbols).forEach { print($0) }
    }
}

public func info(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) {
    return print(items, file: file, line: line, function: function, logLevel: .info)
}

public func debug(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) {
    return print(items, file: file, line: line, function: function, logLevel: .debug)
}

public func warning(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) {
    return print(items, file: file, line: line, function: function, logLevel: .warning)
}

public func error(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) {
    return print(items, file: file, line: line, function: function, logLevel: .error)
}

public func exception(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) {
    return print(items, file: file, line: line, function: function, logLevel: .exception)
}

#endif
