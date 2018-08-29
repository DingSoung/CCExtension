//  Created by Songwen on 2018/8/29.
//  Copyright © 2018 DingSoung. All rights reserved.

import WebKit
import Foundation

extension WKWebView {
    private class func wk_browsing_contextController() -> (NSObject.Type)? {
        guard let str = "YnJvd3NpbmdDb250ZXh0Q29udHJvbGxlcg==".base64Decode else { assertionFailure(); return nil }
        // str: "browsingContextController"
        guard let obj =  WKWebView().value(forKey: str) else { return nil }
        return type(of: obj) as? NSObject.Type
    }
    @discardableResult private class func perform_wk_browsing_contextController(aSelector: Selector, schemes: Set<String>) -> Bool {
        guard let obj = wk_browsing_contextController(), obj.responds(to: aSelector), schemes.count > 0 else {
            assertionFailure(); return false
        }
        schemes.forEach({ (scheme) in
            obj.perform(aSelector, with: scheme)
        })
        return true
    }
}

extension WKWebView {
    @discardableResult private class func wk_register(schemes: Set<String>) -> Bool {
        guard let str = "cmVnaXN0ZXJTY2hlbWVGb3JDdXN0b21Qcm90b2NvbDo=".base64Decode else {
            assertionFailure(); return false
        }
        // str: "registerSchemeForCustomProtocol:"
        let register = NSSelectorFromString(str)
        return perform_wk_browsing_contextController(aSelector: register, schemes: schemes)
    }
    @discardableResult private class func wk_unregister(schemes: Set<String>) -> Bool {
        guard let str = "dW5yZWdpc3RlclNjaGVtZUZvckN1c3RvbVByb3RvY29sOg==".base64Decode else {
            assertionFailure(); return false
        }
        //str: "unregisterSchemeForCustomProtocol:"
        let unregister = NSSelectorFromString(str)
        return perform_wk_browsing_contextController(aSelector: unregister, schemes: schemes)
    }
}

extension WKWebView {
    @discardableResult public class func registerURLProtocol(_ protocolClass: Swift.AnyClass, schemes: Set<String>) -> Bool {
        guard schemes.count > 0 else { return false }
        return wk_register(schemes: schemes) && URLProtocol.registerClass(protocolClass)
    }
    public class func unregisterURLProtocol(_ protocolClass:  Swift.AnyClass, schemes: Set<String>) {
        wk_unregister(schemes: schemes)
        URLProtocol.unregisterClass(protocolClass)
    }
}
