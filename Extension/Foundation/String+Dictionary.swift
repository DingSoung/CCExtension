//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSJSONSerialization

extension String {
    /// JSON String -> JSON Dictionary
    public var jsonDictionary: [String: Any]? {
        guard let jsonData = self.data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            return json as? [String: Any]
        } catch let err {
            error("serlize json string fail", err.localizedDescription)
            return nil
        }
    }
}
#endif
