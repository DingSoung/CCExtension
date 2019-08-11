//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSJSONSerialization

extension String {
    /// JSON String -> JSON Dictionary
    public var jsonDictionary: [String: Any]? {
        guard let jsonData = data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            return json as? [String: Any]
        } catch let err {
            error("serlize json string fail", err.localizedDescription)
            return nil
        }
    }
}

extension String {
    public var cssMap: [String: String]? {
        let array = split(separator: ";")
        guard !array.isEmpty else {
            warning("css is empty: \(self)")
            return nil
        }
        var map = [String: String]()
        array.forEach {
            let pair = $0.split(separator: ":")
            guard pair.count == 2 else {
                error("css pair is error: \($0)")
                return
            }
            let key = pair[0].trimmingCharacters(in: .whitespacesAndNewlines)
            guard map[key] == nil else {
                error("duplicate css pair: \(pair)")
                return
            }
            map[key] = pair[1].trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return map.isEmpty ? nil : map
    }
}

#endif
