//
//  HTTPCookieStorage.swift
//  Extension
//
//  Created by Songwen on 2018/8/28.
//  Copyright © 2018 DingSoung. All rights reserved.
//

import Foundation

extension HTTPCookieStorage {
    public func setCookie(cookie: HTTPCookie) {
        var cookies: [HTTPCookie]
        if let url = cookie.commentURL, let cs = self.cookies(for: url) {
            cookies = cs
        } else {
            cookies = []
        }
        for index in 0..<cookies.count where cookies[index].name == cookie.name {
            cookies.remove(at: index)
            break
        }
        cookies.append(cookie)
        self.setCookies(cookies, for: cookie.commentURL, mainDocumentURL: nil)
    }
}
