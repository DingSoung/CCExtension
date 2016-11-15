//  Created by Songwen Ding on 15/5/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import UIKit

extension UIView {
    
    ///  capture image ,Compatible, alpha
    public func image(alpha:CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0);
        guard let contex = UIGraphicsGetCurrentContext() else {
            return nil
        }
        contex.setAlpha(alpha)
        self.layer.render(in: contex)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return img;
    }
    
    public var image:UIImage? {
        return self.image(alpha: 1)
    }
    
    /// capture image much faster
    public var fastImage:UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0);
        // refer http://stackoverflow.com/questions/4334233/how-to-capture-uiview-to-uiimage-without-loss-of-quality-on-retina-display
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return img;
    }
}

