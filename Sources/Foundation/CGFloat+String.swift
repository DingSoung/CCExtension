#if canImport(CoreGraphics)
import CoreGraphics

extension CGFloat: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: String) {
        if let float = Float(value) {
            self = CGFloat(float)
        } else {
            preconditionFailure("value: \(value) is invalid")
        }
    }
}

#endif
