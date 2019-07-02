extension Float: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: String) {
        if let float = Float(value) {
            self = float
        } else {
            preconditionFailure("value: \(value) is invalid")
        }
    }
}
