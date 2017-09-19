//  NSArray+UIImage.swift
//  Extension

import Foundation

@objc
extension NSArray {

    public var verticalImage: UIImage? {
        return (self as? [UIImage])?.verticalImage
    }
}
