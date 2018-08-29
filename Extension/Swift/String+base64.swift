//  Copyright © 2018 DingSoung. All rights reserved.

extension String {
    public var base64Decode: String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    public var base64Encode: String {
        return Data(self.utf8).base64EncodedString()
    }
}
