//  Created by Songwen Ding on 15/5/26.
//  Copyright © 2016 DingSoung. All rights reserved.

import UIKit

extension UIImage {
    
    /// image to scale
    public func imageWithScale(scale:CGFloat) -> UIImage {
        guard let cgImage = self.CGImage else {
            return self
        }
        return UIImage(CGImage: cgImage, scale: scale, orientation: UIImageOrientation.Up)
    }
    
    /// scale with ratio
    public func imageScaleToRatio(ratio:CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSizeMake(self.size.width * ratio, self.size.height * ratio));
        self.drawInRect(CGRectMake(0, 0, self.size.width * ratio, self.size.height * ratio))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage
    }
    
    /// sacale to size
    public func imageScaleToSize(size:CGSize) -> UIImage {
        // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
        // Pass 1.0 to force exact pixel size.
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
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




