//  Created by Songwen Ding on 15/8/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

#if os(iOS)
import JavaScriptCore
import UIKit

@objc
extension UIWebView {

    internal var context: JSContext? {
        return self.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
    }
    ///add native target for js function
    public func addJsTarget(function: String, block: @convention(block)(AnyObject) -> Void) {
        guard let context = self.context else {
            return
        }
        context.setObject(unsafeBitCast(block, to: AnyObject.self),
                          forKeyedSubscript: function as? (NSCopying & NSObjectProtocol))
    }
    ///call js function
    public func runJsFunction(function: String, parameter: [Any]) {
        guard let context = self.context else {
            return
        }
        context.objectForKeyedSubscript(function).call(withArguments: parameter)
    }
    internal var syncRunJSQueue: DispatchQueue {
        get {
            return DispatchQueue(label: "JavaScriptCore.queue")
        }
        set {
            self.syncRunJSQueue = newValue
        }
    }
    ///call js function
    public func syncRunJsFunction(function: String,
                                  parameter: [Any],
                                  complete: ((_: JSValue?) -> Void)?) {
        self.syncRunJSQueue.sync {
            guard let context = self.context else {
                return
            }
            let jsValue = context.objectForKeyedSubscript(function)
            let value = jsValue?.call(withArguments: parameter)
            complete?(value)
        }
    }
}
#endif
