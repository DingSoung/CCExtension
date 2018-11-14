//  NSArray+UIImage.swift
//  Extension

#if canImport(UIKit)
import UIKit

@objc
extension NSArray {
    public func verticalImage(space: CGFloat, backgroundColor: UIColor?) -> UIImage? {
        return (self as? [UIImage])?.verticalImage(space: space, backgroundColor: backgroundColor)
    }

    public var verticalImage: UIImage? {
        return (self as? [UIImage])?.verticalImage
    }
}
#endif
