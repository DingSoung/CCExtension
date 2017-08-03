//  Created by Songwen Ding on 15/9/29.
//  Copyright © 2015年 DingSoung. All rights reserved.

import Foundation

extension NSDictionary {
    
    /// Dictionary -> JSON Data
    public final var jsonData: Data? {
        return (self as Dictionary).jsonData
    }
}
