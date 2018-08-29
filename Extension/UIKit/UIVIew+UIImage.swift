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
                self.layer.render(in: context)
                context.restoreGState()
            }
        }, size: bounds.size, opaque: self.isOpaque)
    }
    public func image(scale: CGFloat) -> UIImage? {
        return UIImage.image(render: {
            if let contex = UIGraphicsGetCurrentContext() {
                self.layer.render(in: contex)
            }
        }, size: self.bounds.size, opaque: self.isOpaque)
    }
    public var image: UIImage? {
        return self.image(scale: UIScreen.main.scale)
    }
    public var fastImage: UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, UIScreen.main.scale)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
#endif
