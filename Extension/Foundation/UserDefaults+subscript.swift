//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSUserDefaults

extension UserDefaults {
    /// get userdefauts with key
    public subscript(key: String) -> Any? {
        get { return object(forKey: key) }
        set { set(newValue, forKey: key) }
    }
}
#endif
