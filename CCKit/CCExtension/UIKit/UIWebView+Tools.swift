//
//  UIWebView+Tools.swift
//  summer
//
//  Created by Songwen Ding on 15/8/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.
//

import JavaScriptCore
import UIKit

extension UIWebView {
    
    internal var context:JSContext? {
        get {
            return self.valueForKeyPath("documentView.webView.mainFrame.javaScriptContext") as? JSContext
        }
        set {
            self.context = newValue
        }
    }
    ///add native target for js function
    public func addJsTarget(function:String, block: @convention(block)(AnyObject)->Void) {
        guard let context = self.context else {
            return
        }
        context.setObject(unsafeBitCast(block, AnyObject.self), forKeyedSubscript: function)
    }
    ///call js function
    public func runJsFunction(function:String, parameter:[AnyObject]) {
        guard let context = self.context else {
            return
        }
        let jsValue = context.objectForKeyedSubscript(function)
        jsValue.callWithArguments(parameter)
    }
    
    internal var syncRunJSQueue:dispatch_queue_t {
        get {
            return dispatch_queue_create("JavaScriptCore.queue", nil)
        }
        set {
            self.syncRunJSQueue = newValue
        }
    }
    ///call js function
    public func syncRunJsFunction(function:String, parameter:[AnyObject], complete:((value:JSValue)->Void)?) {
        dispatch_sync(self.syncRunJSQueue) { () -> Void in
            guard let context = self.context else {
                return
            }
            let jsValue = context.objectForKeyedSubscript(function)
            let value = jsValue.callWithArguments(parameter)
            complete?(value: value)
        }
    }
}
