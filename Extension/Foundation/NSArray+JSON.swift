//  Created by Songwen Ding on 2017/8/3.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation

extension NSArray {
    
    /// Dictionary -> JSON Data
    public final var jsonData: Data? {
        return (self as Array).jsonData
    }
}
