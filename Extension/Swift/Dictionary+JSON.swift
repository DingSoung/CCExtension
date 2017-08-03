//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

extension Dictionary {
    
    /// Dictionary -> JSON Data
    public var jsonData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch let error as NSError {
            print("format \(String(describing: self)) to Data fail:\(error.domain)")
            return nil
        }
    }
}
