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
}
