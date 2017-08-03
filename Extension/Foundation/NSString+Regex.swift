//  Created by Songwen Ding on 8/23/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import Foundation

extension NSString {
    public func match(regex:String) -> Bool {
        return (self as String) =~ regex
    }
}

extension NSString {
    
    /// check is mobile phone number
    public final var isPRCMobileNumber: Bool {
        return (self as String).isPRCMobileNumber
    }
    
    /// check is ID if People's Republic of China
    public final var isPRCIDNumber: Bool {
        return (self as String).isPRCIDNumber
    }
}
