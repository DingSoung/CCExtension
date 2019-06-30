//  Created by Songwen Ding on 2017/11/28.

#if canImport(Foundation)
import Foundation
#endif

#if canImport(Security)
import Security

public class Keychain {
    @discardableResult public class func save(key: String, group: String? = nil, data: Data) -> Bool {
        var query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data]
        if let group = group { query[kSecAttrAccessGroup] = group }
        SecItemDelete(query as CFDictionary)
        let status: OSStatus = SecItemAdd(query as CFDictionary, nil)
        return status == noErr
    }

    public class func load(key: String, group: String? = nil) -> Data? {
        var query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitOne]
        if let group = group { query[kSecAttrAccessGroup] = group }
        var dataTypeRef: AnyObject?
        let status = withUnsafeMutablePointer(to: &dataTypeRef) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        if status != errSecSuccess { return nil }
        return dataTypeRef as? Data
    }

    @discardableResult public class func delete(key: String, group: String? = nil) -> Bool {
        var query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key]
        if let group = group { query[kSecAttrAccessGroup] = group }
        let status: OSStatus = SecItemDelete(query as CFDictionary)
        return status == noErr
    }

    @discardableResult public class func clear() -> Bool {
        let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword]
        let status: OSStatus = SecItemDelete(query as CFDictionary)
        return status == noErr
    }
}

#endif
