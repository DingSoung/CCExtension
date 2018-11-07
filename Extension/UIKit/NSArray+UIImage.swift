//  NSArray+UIImage.swift
//  Extension

import Foundation

@objc
extension NSArray {
    public func verticalImage(space: CGFloat, backgroundColor: UIColor?) -> UIImage? {
        return (self as? [UIImage])?.verticalImage(space: space, backgroundColor: backgroundColor)
    }

    public var verticalImage: UIImage? {
        return (self as? [UIImage])?.verticalImage
    }
}
