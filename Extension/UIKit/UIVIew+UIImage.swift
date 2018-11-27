//  Created by Songwen Ding on 15/5/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

#if os(iOS)
import UIKit

extension UIView {
    ///  capture image, Compatible, alpha
    public func image(alpha: CGFloat, bounds: CGRect, scale: CGFloat) -> UIImage? {
        return UIImage.image(render: {
            if let context = UIGraphicsGetCurrentContext() {
                context.saveGState()
                context.setAlpha(alpha)
                context.concatenate(CGAffineTransform(translationX: bounds.origin.x,
                                                      y: bounds.origin.y).inverted())
                layer.render(in: context)
                context.restoreGState()
            }
        }, size: bounds.size, opaque: isOpaque)
    }
    public func image(scale: CGFloat) -> UIImage? {
        return UIImage.image(render: {
            if let contex = UIGraphicsGetCurrentContext() {
                layer.render(in: contex)
            }
        }, size: bounds.size, opaque: isOpaque)
    }
    public var image: UIImage? {
        return image(scale: UIScreen.main.scale)
    }
    public var fastImage: UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: false)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
#endif
