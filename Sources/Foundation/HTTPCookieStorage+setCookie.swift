//
//  HTTPCookieStorage.swift
//  Extension
//
//  Created by Songwen on 2018/8/28.
//  Copyright © 2018 DingSoung. All rights reserved.
//

#if canImport(Foundation)
import Foundation.NSHTTPCookie

extension HTTPCookieStorage {
    public func setCookie(cookie: HTTPCookie) {
        var cookies: [HTTPCookie]
        if let url = cookie.commentURL, let cos = self.cookies(for: url) {
            cookies = cos
        } else {
            cookies = []
        }
        for index in 0..<cookies.count where cookies[index].name == cookie.name {
            cookies.remove(at: index)
            break
        }
        cookies.append(cookie)
        setCookies(cookies, for: cookie.commentURL, mainDocumentURL: nil)
    }
}
#endif
