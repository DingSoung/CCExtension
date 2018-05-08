//  Created by Songwen Ding on 2017/11/23.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

public extension URL {
    public func setCookie(value: String, forName name: String) {
        var cookies = HTTPCookieStorage.shared.cookies(for: self) ?? []
        for index in 0..<cookies.count where cookies[index].name == name {
            cookies.remove(at: index)
            break
        }
        guard let cookie = HTTPCookie(properties: [
            .name: name,
            .value: value,
            .originURL: self,
            .path: "/",
            .expires: Date.init(timeIntervalSinceNow: 3 * 365 * 24 * 60 * 60)
            ]) else { return }
        cookies.append(cookie)
        HTTPCookieStorage.shared.setCookies(cookies, for: self, mainDocumentURL: nil)
    }
}
