//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSThread

public enum LogLevel: String {
    case debug, info, warning, error, exception
}

fileprivate extension LogLevel {
    var symbol: String {
        switch self {
        case .debug: return "\u{0001F539}"
        case .info: return "\u{0001F538}"
        case .warning: return "\u{26A0}\u{FE0F}"
        case .error: return "\u{0001F6AB}"
        case .exception: return "\u{2757}\u{FE0F}"
        }
    }
}

private struct Log: TextOutputStream {
    static var shared = Log()
    #if DEBUG
    var file = "debug_log.txt"
    #else
    var file = "log.txt"
    #endif
    private init() {}
    /// Appends the given string to the stream.
    mutating func write(_ string: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        let documentDirectoryPath = paths.first!
        let log = documentDirectoryPath.appendingPathComponent(self.file)
        do {
            let handle = try FileHandle(forWritingTo: log)
            handle.seekToEndOfFile()
            handle.write(string.data(using: .utf8)!)
            handle.closeFile()
        } catch {
            Swift.print(error.localizedDescription)
            do {
                try string.data(using: .utf8)?.write(to: log)
            } catch {
                Swift.print(error.localizedDescription)
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
    let log = { (items: Any...) in
        print(items, to: &Log.shared)
    }
    log(logLevel.symbol, logLevel.rawValue, CFAbsoluteTimeGetCurrent(), "⇨",
        fileName, line, function)
    items.forEach { log($0) }
    switch logLevel {
    case .debug, .info:
        break
    case .warning:
        log(Thread.current)
    case .error, .exception:
        log(Thread.current)
        Thread.callStackSymbols.forEach { log($0) }
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
