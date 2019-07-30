//  Created by Songwen on 2018/08/12.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSData

extension String {
    public var base64Decode: String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    public var base64Encode: String {
        return Data(utf8).base64EncodedString()
    }
}
#endif
