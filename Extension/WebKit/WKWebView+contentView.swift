//  Created by Songwen on 2018/11/13.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(WebKit) && os(iOS)
import WebKit

extension WKWebView {
    /// refer contentView
    @objc public var contentView: View? {
        guard let prifix = "V0tDb250ZW50Vmlldw==".base64Decode else { assertionFailure(); return nil }
        for view in self.scrollView.subviews {
            if String(describing: type(of: view)).hasPrefix(prifix) {
                return view
            }
        }
        return nil
    }

    /// generate or get class with uniqueid(bundle only prefered)
    public func contentViewNickClass(id: String) -> AnyClass? {
        guard var name = "V0tDb250ZW50Vmlldw==".base64Decode else { assertionFailure(); return nil }
        name += id
        var cls: AnyClass? = NSClassFromString(name)
        if cls == nil,
            let contentView = self.contentView,
            let newCls = objc_allocateClassPair(type(of: contentView).self, name, 0) {
            objc_registerClassPair(newCls)
            cls = newCls
        }
        return cls
    }
}

#endif
