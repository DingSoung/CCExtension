//  Created by Songwen Ding on 15/8/12.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import Foundation

extension NSObject {
    
    /// init model with JSON String
    public convenience init(JSONDict : [String : AnyObject]) {
        self.init()
        self.setValuesForKeysWithDictionary(JSONDict)
    }
    
    /// init model with JSON Dictionary
    public convenience init(JSONStr: String) {
        self.init()
        let JSONData = JSONStr.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        do {
            let JSONDictionary = try NSJSONSerialization.JSONObjectWithData(JSONData!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            for (key, value) in JSONDictionary {
                let keyName = key as! String
                let keyValue: String = value as! String
                if (self.respondsToSelector(NSSelectorFromString(keyName))) {
                    self.setValue(keyValue, forKey: keyName)
                }
            }
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
