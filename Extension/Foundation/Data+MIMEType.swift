//  Created by Songwen Ding on 2018/6/5.
//  Copyright © 2018年 DingSoung. All rights reserved.

import Foundation

extension Data {
    /// -> json object
    public var jsonObject: Any? {
        do {
            return try  JSONSerialization.jsonObject(with: self)
        } catch let error {
            debugPrint(error.localizedDescription, self.debugDescription)
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
