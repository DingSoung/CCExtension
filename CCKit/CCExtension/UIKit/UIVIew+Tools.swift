//
//  UIVIew+Tools.swift
//  summer
//
//  Created by Songwen Ding on 15/5/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.
//

import UIKit

extension UIView {
    
    /// capture image ,Compatible
    public var imageCompatible:UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
        guard let contex = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.renderInContext(contex)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return img;
    }
    
    /// capture image much faster
    public var image:UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
        // refer http://stackoverflow.com/questions/4334233/how-to-capture-uiview-to-uiimage-without-loss-of-quality-on-retina-display
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return img;
    }
}

