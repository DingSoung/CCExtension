//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

extension Data {

    /// JSON data -> JSON Object (Array or Dictionary)
    public var jsonObject: Any? {
        do {
            return try  JSONSerialization.jsonObject(with: self as Data,
                                                     options: JSONSerialization.ReadingOptions.mutableLeaves)
        } catch let error {
            debugPrint(error.localizedDescription, self.debugDescription)
            return nil
        }
    }

    /// JSON data -> JSON Array
    public var jsonArray: NSArray? {
        return self.jsonObject as? NSArray
    }

    /// JSON data -> JSON Dictionary
    public var jsonDictionary: NSDictionary? {
        return self.jsonObject as? NSDictionary
    }

    /// JSON Data -> JSON String
    public var jsonString: NSString? {
        guard let str = NSString(data: self, encoding: String.Encoding.utf8.rawValue) else {
            debugPrint(self.debugDescription)
            return nil
        }
        return str
    }
}
