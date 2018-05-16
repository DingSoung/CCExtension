//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

extension Data {
    /// JSON data -> JSON Object (Array or Dictionary)
    public var jsonObject: Any? {
        do {
            return try  JSONSerialization.jsonObject(with: self)
        } catch let error {
            debugPrint(error.localizedDescription, self.debugDescription)
            return nil
        }
    }
    /// JSON data -> JSON Array
    public var jsonArray: [Any]? {
        return self.jsonObject as? Array
    }
    /// JSON data -> JSON Dictionary
    public var jsonDictionary: [String: Any]? {
        return self.jsonObject as? [String: Any]
    }
    /// JSON Data -> JSON String
    public var jsonString: String? {
        return String(data: self, encoding: .utf8)
    }
}
