//  Created by Songwen Ding on 2018/6/5.
//  Copyright © 2018年 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation
import Foundation

extension CFAbsoluteTime {
    public init(_ syncBlock: () -> Void) {
        let start = CFAbsoluteTimeGetCurrent()
        syncBlock()
        self = CFAbsoluteTimeGetCurrent() - start
    }
}

#endif
