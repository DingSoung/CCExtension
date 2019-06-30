//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSJSONSerialization

extension Array {
    /// -> JSON data
    public var jsonData: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch let err {
            error("serize json array fail", err.localizedDescription)
            return nil
        }
    }
}
#endif
