extension Int: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: String) {
        if let int = Int(value) {
            self = int
        } else {
            preconditionFailure("value: \(value) is invalid")
        }
    }
}
