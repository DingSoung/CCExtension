//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

extension Data {
    /// JSON data -> JSON Object (Array or Dictionary)
    public var jsonObject: Any? {
        do {
            return try  JSONSerialization.jsonObject(with: self,
                                                     options: JSONSerialization.ReadingOptions.mutableLeaves)
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
    public var jsonDictionary: NSDictionary? {
        return self.jsonObject as? NSDictionary
    }
    /// JSON Data -> JSON String
    public var jsonString: String? {
        return String(data: self, encoding: String.Encoding.utf8)
    }
}
