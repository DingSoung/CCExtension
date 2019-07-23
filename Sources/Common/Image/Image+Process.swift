//  Created by Songwen Ding on 15/5/26.
//  Copyright © 2016 DingSoung. All rights reserved.

#if canImport(UIKit)
import UIKit

extension Image {
    /// image to scale
    public func image(scale: CGFloat) -> Image {
        guard let cgImage = cgImage else {
            return self
        }
        return UIImage(cgImage: cgImage, scale: scale, orientation: UIImage.Orientation.up)
    }
    /// scale with ratio
    public func image(ratio: CGFloat) -> Image? {
        UIGraphicsBeginImageContext(CGSize(width: size.width * ratio, height: size.height * ratio))
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0),
                        size: CGSize(width: size.width * ratio,
                                     height: size.height * ratio)))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
    /// sacale to size
    public func image(size: CGSize) -> Image? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    /// image with cornal radius
    public func image(radius: CGFloat) -> Image? {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.addPath(UIBezierPath(roundedRect: rect, cornerRadius: radius).cgPath)
        context.clip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    /// image with corner radius with half of min width or height
    public var roundImage: UIImage? {
        return image(radius: min(size.width, size.height) * 0.5)
    }
}
#endif
