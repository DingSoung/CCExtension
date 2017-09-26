//  Created by Songwen Ding on 15/8/12.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import Foundation

@objc
extension NSObject {
    
    /// init model with JSON String
    public convenience init(JSONDict: [String: Any]) {
        self.init()
        self.setValuesForKeys(JSONDict)
    }
    /// init model with JSON Dictionary
    public convenience init(JSONStr: String) {
        self.init()
        guard let data = JSONStr.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return }
        do {
            let json = try JSONSerialization.jsonObject(with: data,
                                                        options: JSONSerialization.ReadingOptions.mutableContainers)
            guard let dict = json as? [String: Any] else { return }
            self.setValuesForKeys(dict)
            /*
             for (key, value) in JSONDictionary {
             let keyName = key as! String
             let keyValue: String = value as! String
             self.setValue(keyValue, forKey: keyName)
             }*/
        } catch {
            print(error)
        }
    }
    // MARK: 字典转model array
    /*
     class func modelWithArray(dictArray:[NSDictionary]) -> NSArray {
     var dsts: NSMutableArray = []
     for src in dictArray {
     var dst = self.new()
     dst.setValuesForKeysWithDictionary(src as [NSObject : AnyObject])
     dsts.addObject(dst)
     }
     return dsts
     }*/
    /*
     func setValue(value: AnyObject!, forUndefinedKey key: String) {
     #if DEBUG
     print("undefined \(key):\(value)")
     #endif
     //override this func to deal with the key and value
     }*/
}
