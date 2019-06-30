//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSURL

extension URL {
    /// Dictionary of the URL's query parameters
    public var query: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
            let queryItems = components.queryItems else { return nil }
        var items: [String: String] = [:]
        for queryItem in queryItems {
            items[queryItem.name] = queryItem.value
        }
        return items
    }
}

extension URL {
    /// exp: http://google.com, ["q": "hello world"] => http://google.com?q=hello%20world
    public func appendingQuery(parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = items
        return urlComponents.url!
    }

    /// same as appendingQuery
    public mutating func appendingQuery(parameters: [String: String]) {
        self = appendingQuery(parameters: parameters)
    }
}
#endif
