//  Created by Songwen Ding on 15/8/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

#if os(iOS)
import JavaScriptCore
import UIKit

@objc public extension UIWebView {
    private static var jsContextKey: UInt8 = 0
    public var jsContext: JSContext? {
        set { objc_setAssociatedObject(self, &UIWebView.jsContextKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
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
    /// add native target for js function
    public func add(function: String, block: @convention(block)(AnyObject) -> Void) {
        self.setObject(unsafeBitCast(block, to: AnyObject.self), forKeyedSubscript: function as NSCopying & NSObjectProtocol)
    }
    ///call js function
    public func run(function: String, parameter: [Any]) -> JSValue {
        return self.objectForKeyedSubscript(function).call(withArguments: parameter)
    }
    ///call js function
    public func syncRunJsFunction(function: String, parameter: [Any], complete: ((_: JSValue?) -> Void)?) {
        DispatchQueue.global().async {
            let jsValue = self.objectForKeyedSubscript(function)
            let value = jsValue?.call(withArguments: parameter)
            complete?(value)
        }
    }
}
#endif
