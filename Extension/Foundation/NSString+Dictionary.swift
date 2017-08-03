//  Created by Songwen Ding on 12/15/15.
//  Copyright © 2015 DingSoung. All rights reserved.

import Foundation

extension NSString {
    
    /// JSON String -> JSON Dictionary
    public final var jsonDictionary: Dictionary<String, Any>? {
        return (self as String).jsonDictionary
    }
    
    /// url format -> Dictionary
    public final var urlDictionary: Dictionary<String, Any> {
        return (self as String).urlDictionary
    }
}


