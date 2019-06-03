//  Created by Songwen Ding on 15/5/26.
//  Copyright (c) 2015 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSThread

private enum LogLevel: String {
    case debug, info, warning, error, exception
}

private extension LogLevel {
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
    let file = "debug_log.txt"
    #else
    let file = "log.txt"
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
private func log(
    _ items: Any..., separator: String = " ", terminator: String = "\n",
    file: String = #file, line: Int = #line, function: String = #function,
    logLevel: LogLevel) {
    let fileName = URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
    
    print(logLevel.symbol, logLevel.rawValue, CFAbsoluteTimeGetCurrent(), "⇨", fileName, line, function)
    print(logLevel.symbol, logLevel.rawValue, CFAbsoluteTimeGetCurrent(), "⇨", fileName, line, function, to: &Log.shared)
    
    print(items, separator: separator, terminator: terminator)
    print(items, to: &Log.shared)
    
    switch logLevel {
    case .debug, .info:
        break
    case .warning:
        print(Thread.current)
        print(Thread.current, to: &Log.shared)
    case .error, .exception:
        print(Thread.current)
        print(Thread.current, to: &Log.shared)
        Thread.callStackSymbols.forEach {
            print($0)
            print($0, to: &Log.shared)
        }
    }
}

public func info(
    _ items: Any..., separator: String = " ", terminator: String = "\n",
    file: String = #file, line: Int = #line, function: String = #function) {
    return log(items, separator: separator, terminator: terminator,
               file: file, line: line, function: function, logLevel: .info)
}

public func debug(
    _ items: Any..., separator: String = " ", terminator: String = "\n",
    file: String = #file, line: Int = #line, function: String = #function) {
    return log(items, separator: separator, terminator: terminator,
               file: file, line: line, function: function, logLevel: .debug)
}

public func warning(
    _ items: Any..., separator: String = " ", terminator: String = "\n",
    file: String = #file, line: Int = #line, function: String = #function) {
    return log(items, separator: separator, terminator: terminator,
               file: file, line: line, function: function, logLevel: .warning)
}

public func error(
    _ items: Any..., separator: String = " ", terminator: String = "\n",
    file: String = #file, line: Int = #line, function: String = #function) {
    return log(items, separator: separator, terminator: terminator,
               file: file, line: line, function: function, logLevel: .error)
}

public func exception(
    _ items: Any..., separator: String = " ", terminator: String = "\n",
    file: String = #file, line: Int = #line, function: String = #function) {
    return log(items, separator: separator, terminator: terminator,
               file: file, line: line, function: function, logLevel: .exception)
}

#endif
