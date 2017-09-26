//  Created by Songwen Ding on 15/5/26.
//  Copyright © 2016 DingSoung. All rights reserved.

#if os(iOS)
import UIKit

@objc
extension UIImage {

    /// image to scale
    public func imageWithScale(scale: CGFloat) -> UIImage {
        guard let cgImage = self.cgImage else {
            return self
        }
        return UIImage(cgImage: cgImage, scale: scale, orientation: UIImageOrientation.up)
    }

    /// scale with ratio
    public func imageScaleToRatio(ratio: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: self.size.width * ratio, height: self.size.height * ratio))
        self.draw(in: CGRect(origin: CGPoint(x: 0, y: 0),
                             size: CGSize(width: self.size.width * ratio,
                                          height: self.size.height * ratio)))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }

    /// sacale to size
    public func imageScaleToSize(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /// image with cornal radius
    public func imageWithCornerRadius(radius: CGFloat) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        context.addPath(UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath)
        context.clip()
        self.draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /// image with corner radius with half of min width or height
    public var roundImage: UIImage? {
        return self.imageWithCornerRadius(radius: min(self.size.width, self.size.height) * 0.5)
    }
}
#endif
