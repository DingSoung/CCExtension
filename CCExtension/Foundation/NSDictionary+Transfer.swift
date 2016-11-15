//  Created by Songwen Ding on 15/9/29.
//  Copyright © 2015年 DingSoung. All rights reserved.

import Foundation

extension NSDictionary {
    
    // Dictionary -> JSON Data
    public var jsonData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch let error as NSError {
            print("format \(String(describing: self)) to Data fail:\(error.domain)")
            return nil
        }
    }
}
