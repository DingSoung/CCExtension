#if canImport(Foundation)
import Foundation

extension URL: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: String) {
        if let url = URL(string: value) {
            self = url
        } else {
            preconditionFailure("value: \(value) is invalid")
        }
    }
}

#endif
