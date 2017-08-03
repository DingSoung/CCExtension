//  Created by Songwen Ding on 15/8/12.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import Foundation

extension NSObject {
    
    /// init model with JSON String
    public convenience init(JSONDict : [String : AnyObject]) {
        self.init()
        self.setValuesForKeys(JSONDict)
    }
    
    /// init model with JSON Dictionary
    public convenience init(JSONStr: String) {
        self.init()
        let JSONData = JSONStr.data(using: String.Encoding.utf8, allowLossyConversion: false)
        do {
            guard let jsonDictionary = try JSONSerialization.jsonObject(with: JSONData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any] else {return}
            self.setValuesForKeys(jsonDictionary)
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
    
    //MARK: 字典转model array
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
