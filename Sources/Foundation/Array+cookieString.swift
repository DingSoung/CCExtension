//  Created by Songwen Ding on 2018/12/18.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSURL
import Foundation.NSHTTPCookie

extension Array where Element: HTTPCookie {
    public var cookieString: String {
        return self.map({ (cookie) -> String in
            return "\(cookie.name)=\(cookie.value)"
        }).joined(separator: ";")
    }
}
#endif
