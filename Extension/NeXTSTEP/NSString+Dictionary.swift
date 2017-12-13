//  Created by Songwen Ding on 12/15/15.
//  Copyright © 2015 DingSoung. All rights reserved.

import Foundation

@objc
extension NSString {
    
    /// JSON String -> JSON Dictionary
    public final var jsonDictionary: [String: Any]? {
        return (self as String).jsonDictionary
    }
    
    /// url format -> Dictionary
    public final var urlDictionary: [String: Any] {
        return (self as String).urlDictionary
    }
}
