//  Created by Songwen Ding on 10/12/17.
//  Copyright © 2017 DingSoung. All rights reserved.

import Foundation

extension Dictionary where Key == String {
    /// -> serialize to data
    public var json: Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self)
        } catch let error {
            debugPrint(error.localizedDescription, self.debugDescription)
            return nil
        }
    }
    /// -> url encode
    public var wwwFormUrlEncoded: String {
        var components: [(String, String)] = []
        for key in self.keys.sorted(by: <) {
            let value = self[key]!
            components += String.queryComponents(fromKey: key, value: value)
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
    /// -> form data
    public func formData(boundary: String, name: String, type: String, file: Data) -> Data {
        var data = Data()
        let prifix = "--" + boundary + "\r\n"
        self.forEach({ (key, value) in
            if key == "file" || key == "size" { return }
            data.appendString(prifix)
            data.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            data.appendString("\(value)\r\n")
        })
        // size
        data.appendString(prifix)
        data.appendString("Content-Disposition: form-data; name=\"\("size")\"\r\n\r\n")
        data.appendString("\(file.count)\r\n")
        // type & file
        data.appendString(prifix)
        data.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(name)\"\r\n")
        data.appendString("Content-Type: \(type)\r\n\r\n")
        data.append(file)
        data.appendString("\r\n")
        data.appendString("--" + boundary + "--")
        return data
    }
}

extension Data {
    fileprivate mutating func appendString(_ string: String) {
        guard let data = string.data(using: .utf8, allowLossyConversion: false) else {
            return
        }
        self.append(data)
    }
}

extension Dictionary where Key == String {
    /// -> json data string
    public var jsonString: String? {
        guard let data = self.json else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

// MARK: - for url encoded
extension NSNumber {
    fileprivate var isBool: Bool { return CFBooleanGetTypeID() == CFGetTypeID(self) }
}

extension String {
    fileprivate var escape: String {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        var escaped = ""
        if #available(iOS 8.3, *) {
            escaped = self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? self
        } else {
            let batchSize = 50
            var index = self.startIndex
            while index != self.endIndex {
                let startIndex = index
                let endIndex = self.index(index, offsetBy: batchSize, limitedBy: self.endIndex) ?? self.endIndex
                let range = startIndex..<endIndex
                let substring = self[range]
                escaped += substring.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? String(substring)
                index = endIndex
            }
        }
        return escaped
    }
    fileprivate static func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components: [(String, String)] = []
        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += queryComponents(fromKey: "\(key)[]", value: value)
            }
        } else if let value = value as? NSNumber {
            if value.isBool {
                components.append((key.escape, (value.boolValue ? "1" : "0").escape))
            } else {
                components.append((key.escape, "\(value)".escape))
            }
        } else if let bool = value as? Bool {
            components.append((key.escape, (bool ? "1" : "0").escape))
        } else {
            components.append((key.escape, "\(value)".escape))
        }
        return components
    }
}
