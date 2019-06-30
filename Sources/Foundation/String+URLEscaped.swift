//  Created by Songwen Ding on 2019/1/28.
//  Copyright © 2019 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation

extension String {
    public var URLEscaped: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}

#endif
