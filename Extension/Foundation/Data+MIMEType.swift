//  Created by Songwen Ding on 2018/6/5.
//  Copyright © 2018年 DingSoung. All rights reserved.

import Foundation

#if canImport(Foundation)
extension Data {
    /// -> json object
    public var jsonObject: Any? {
        do {
            return try  JSONSerialization.jsonObject(with: self)
        } catch let err {
            error("serize json data fail", err.localizedDescription)
            return nil
        }
    }
}

extension Data {
    /// -> json array
    public var jsonArray: [Any]? {
        return self.jsonObject as? Array
    }
    /// -> json dict
    public var jsonDictionary: [String: Any]? {
        return self.jsonObject as? [String: Any]
    }
}
#endif
