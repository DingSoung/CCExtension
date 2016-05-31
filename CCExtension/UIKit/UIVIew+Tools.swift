//
//  UIVIew+Tools.swift
//  summer
//
//  Created by Cuicui2 on 15/5/27.
//  Copyright (c) 2015年 ifnil All rights reserved.
//

import UIKit

extension UIView {
    
    /// set shadow
    public func setShadow(color:CGColor? = UIColor.blackColor().CGColor, offset:CGSize? = CGSizeMake(0.25, 0.5), opacity:Float? = 0.15, radius:CGFloat? = 1.5) {
        if let v = color { self.layer.shadowColor = v }
        if let v = offset { self.layer.shadowOffset = v }
        if let v = opacity { self.layer.shadowOpacity = v }
        if let v = radius { self.layer.shadowRadius = v }
    }
    
    /// set shadow Compatible Objective－C
    public func setShadowOC(color:CGColor, offset:CGSize, opacity:Float, radius:CGFloat) {
        self.setShadow(color, offset: offset, opacity: opacity, radius: radius)
    }
    
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
    
    /// view in fll screem
    public func viewInFullScreen() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.backgroundColor = UIColor(white: 0, alpha: 0.3)
        })
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.fullViewTapGesture(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    public func fullViewTapGesture(sender:UIPanGestureRecognizer) {
        UIView.animateWithDuration(1, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.backgroundColor = UIColor(white: 0, alpha: 0)
            }, completion: {(value:Bool) in
                self.removeFromSuperview()
        })
    }
}

