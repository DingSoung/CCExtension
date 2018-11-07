//  Created by Songwen Ding on 15/8/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

#if canImport(JavaScriptCore)
import JavaScriptCore
#if canImport(UIKit)
import UIKit

extension UIWebView {
    private static var jsContextKey: UInt8 = 0
    public var jsContext: JSContext? {
        set { objc_setAssociatedObject(self, &UIWebView.jsContextKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
        get {
            guard let value = objc_getAssociatedObject(self, &UIWebView.jsContextKey) as? JSContext else {
                let obj = self.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
                self.jsContext = obj
                return obj
            }
            return value
        }
    }
}

extension JSContext {
    /// register func: (Any) -> Void
    public func register(function: String, block: @escaping () -> Void) {
        let castedBlock: AnyObject = unsafeBitCast(block as @convention(block) () -> Void, to: AnyObject.self)
        self.setObject(castedBlock, forKeyedSubscript: function as NSCopying & NSObjectProtocol)
    }

    /// call js: (xx,...) -> value
    public func sync(function: String, parameter: [Any]) -> JSValue {
        return self.objectForKeyedSubscript(function).call(withArguments: parameter)
    }

    /// async call js: (xx,...) -> value
    public func async(function: String, parameter: [Any], complete: ((_: JSValue?) -> Void)?) {
        DispatchQueue.global().async {
            let jsValue = self.objectForKeyedSubscript(function)
            let value = jsValue?.call(withArguments: parameter)
            complete?(value)
        }
    }
}

#endif
#endif
