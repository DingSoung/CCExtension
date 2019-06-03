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

private struct Log: TextOutputStream {
    static var log: Log = Log()
    private init() {}
    /// Appends the given string to the stream.
    mutating func write(_ string: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        let documentDirectoryPath = paths.first!
        let log = documentDirectoryPath.appendingPathComponent("log.txt")
        do {
            let handle = try FileHandle(forWritingTo: log)
            handle.seekToEndOfFile()
            handle.write(string.data(using: .utf8)!)
            handle.closeFile()
        } catch {
            print(error.localizedDescription)
            do {
                try string.data(using: .utf8)?.write(to: log)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

/// log with detail message
public func print(
    _ items: Any...,
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel = .info) {
    let fileName = URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
    switch logLevel {
    case .info, .debug, .warning:
        #if DEBUG
        print(logLevel.symbol, logLevel.rawValue, CFAbsoluteTimeGetCurrent(), "⇨",
              fileName, line, function,
              to: &Log.log)
        items.forEach { print($0) }
        #endif
    case .error, .exception:
        print(logLevel.symbol, logLevel.rawValue, CFAbsoluteTimeGetCurrent(), "⇨",
              fileName, line, function,
              to: &Log.log)
        items.forEach { print($0, to: &Log.log) }
        print(Thread.current, to: &Log.log)
        Thread.callStackSymbols.forEach { print($0, to: &Log.log) }
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
