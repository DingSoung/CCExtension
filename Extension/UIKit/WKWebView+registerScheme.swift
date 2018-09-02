//  Created by Songwen on 2018/8/29.
//  Copyright © 2018 DingSoung. All rights reserved.

import WebKit
import Foundation

extension WKWebView {
    private class func browsing_contextController() -> (NSObject.Type)? {
        guard let str = "YnJvd3NpbmdDb250ZXh0Q29udHJvbGxlcg==".base64Decode else { assertionFailure(); return nil }
        // str: "browsingContextController"
        guard let obj =  WKWebView().value(forKey: str) else { return nil }
        return type(of: obj) as? NSObject.Type
    }

    private class func perform_browsing_contextController(aSelector: Selector, schemes: Set<String>) -> Bool {
        guard let obj = browsing_contextController(), obj.responds(to: aSelector), schemes.count > 0 else {
            assertionFailure(); return false
        }
        var result = schemes.count > 0
        schemes.forEach({ (scheme) in
            let ret = obj.perform(aSelector, with: scheme)
            result = result && (ret != nil)
        })
        return result
    }
}

extension WKWebView {
    @discardableResult public class func register(schemes: Set<String>) -> Bool {
        guard let str = "cmVnaXN0ZXJTY2hlbWVGb3JDdXN0b21Qcm90b2NvbDo=".base64Decode else {
            assertionFailure(); return false
        }
        // str: "registerSchemeForCustomProtocol:"
        let register = NSSelectorFromString(str)
        return perform_browsing_contextController(aSelector: register, schemes: schemes)
    }

    @discardableResult public class func unregister(schemes: Set<String>) -> Bool {
        guard let str = "dW5yZWdpc3RlclNjaGVtZUZvckN1c3RvbVByb3RvY29sOg==".base64Decode else {
            assertionFailure(); return false
        }
        //str: "unregisterSchemeForCustomProtocol:"
        let unregister = NSSelectorFromString(str)
        return perform_browsing_contextController(aSelector: unregister, schemes: schemes)
    }
}
