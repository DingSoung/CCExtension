//  Created by Songwen Ding on 2018/11/13.
//  Copyright © 2018年 DingSoung. All rights reserved.

#if canImport(WebKit) && iOS
import WebKit

// MARK: - WebView override to return custom view
extension WKWebView {
    private static var inputViewKey: UInt8 = 0
    @objc open override var inputView: View? {
        if let view = objc_getAssociatedObject(self, &WKWebView.inputViewKey) as? View {
            return view
        } else {
            return super.inputAccessoryView
        }
    }
}

extension WKWebView {
    private static var inputAccessoryViewKey: UInt8 = 0
    @objc open override var inputAccessoryView: View? {
        if let view = objc_getAssociatedObject(self, &WKWebView.inputAccessoryViewKey) as? View {
            return view
        } else {
            return super.inputAccessoryView
        }
    }
}

extension WKWebView {
    private static var inputKey: UInt8 = 0
    /// customize input and accessory view
    public var input: Input {
        set { objc_setAssociatedObject(self, &WKWebView.inputKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
        get {
            guard let value = objc_getAssociatedObject(self, &WKWebView.inputKey) as? Input else {
                let obj =  Input(target: self)
                self.input = obj
                return obj
            }
            return value
        }
    }
}

extension WKWebView {
    @objc public class Input: NSObject {
        private weak var target: WKWebView?

        private override init() {
            super.init()
        }

        public init(target: WKWebView) {
            self.target = target
            super.init()
            guard let contentView = target.contentView,
                let nickClass = target.contentViewNickClass(id: Bundle.main.bundlePath.hashValue.description) else {
                    assertionFailure()
                    return
            }
            // replace or update class
            let selectors = [#selector(getter: inputView), #selector(getter: inputAccessoryView)]
            for selector in selectors {
                guard let method = class_getInstanceMethod(WKWebView.self, selector) else {
                    assertionFailure(); continue
                }
                if class_addMethod(nickClass.self,
                                   selector,
                                   method_getImplementation(method),
                                   method_getTypeEncoding(method)) {
                } else {
                    class_replaceMethod(nickClass.self,
                                        selector,
                                        method_getImplementation(method),
                                        method_getTypeEncoding(method))
                }
            }
            object_setClass(contentView, nickClass)
        }

        deinit {
            // no need to restore
        }
    }
}

extension WKWebView.Input {
    /// input view
    @objc dynamic public var view: View? {
        set {
            if let webView = self.target {
                objc_setAssociatedObject(webView,
                                         &WKWebView.inputViewKey,
                                         newValue,
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                webView.reloadInputViews()
            }
            self.target?.contentView?.reloadInputViews()
        }
        get {
            guard let webView = self.target else { return nil }
            return objc_getAssociatedObject(webView, &WKWebView.inputViewKey) as? View
        }
    }
    /// input accessory view
    @objc dynamic public var accessoryView: View? {
        set {
            if let webView = self.target {
                objc_setAssociatedObject(webView,
                                         &WKWebView.inputAccessoryViewKey,
                                         newValue,
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                webView.reloadInputViews()
            }
            self.target?.contentView?.reloadInputViews()
        }
        get {
            guard let webView = self.target else { return nil }
            return objc_getAssociatedObject(webView, &WKWebView.inputAccessoryViewKey) as? View
        }
    }
}
#endif
