//
//  UIImage+Tools.swift
//  
//
//  Created by Songwen Ding on 15/5/26.
//
//

import UIKit

extension UIImage {
    
    /// scale with ratio
    public func scaledWithRatio(ratio:CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSizeMake(self.size.width * ratio, self.size.height * ratio));
        self.drawInRect(CGRectMake(0, 0, self.size.width * ratio, self.size.height * ratio))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage
    }
    
    /// sacale to size
    public func scaledWithSize(size:CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size);
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage
    }
    
    /// image with cornal radius
    public func imageWithCornerRadius(radius:CGFloat) -> UIImage {
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.mainScreen().scale)
        CGContextAddPath(UIGraphicsGetCurrentContext(), UIBezierPath(roundedRect: rect, cornerRadius: radius).CGPath)
        CGContextClip(UIGraphicsGetCurrentContext())
        self.drawInRect(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// image with corner radius with half of min width or height
    public var roundImage:UIImage {
        return self.imageWithCornerRadius(min(self.size.width, self.size.height) * 0.5)
    }
}




