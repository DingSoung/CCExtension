//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation.NSUserDefaults

extension UserDefaults {
    /// get decodeable object
    public func object<T: Codable>(_ type: T.Type,
                                   with key: String,
                                   usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self[key] as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }

    /// set encodeable object
    public func set<T: Codable>(object: T,
                                forKey key: String,
                                usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self[key] = data
    }
}
#endif
