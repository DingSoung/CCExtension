//  Created by Songwen Ding on 15/5/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import UIKit

extension UIView {
    
    ///  capture image, Compatible, alpha
    public func image(alpha:CGFloat) -> UIImage? {
        var image: UIImage?
        autoreleasepool { () -> Void in
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, UIScreen.main.scale);
            if let contex = UIGraphicsGetCurrentContext() {
                contex.setAlpha(alpha)
                self.layer.render(in: contex)
                image = UIGraphicsGetImageFromCurrentImageContext()
            }
            UIGraphicsEndImageContext();
        }
        return image
    }
    
    public var image:UIImage? {
        return self.image(alpha: 1)
    }
    
    /// capture image much faster refer http://stackoverflow.com/questions/4334233/how-to-capture-uiview-to-uiimage-without-loss-of-quality-on-retina-display
    public var fastImage:UIImage? {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, UIScreen.main.scale);
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image;
    }
}
