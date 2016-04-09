//
//  UIVIew+Tools.swift
//  summer
//
//  Created by Cuicui2 on 15/5/27.
//  Copyright (c) 2015年 ifnil All rights reserved.
//

import UIKit

extension UIView {
    
    ///MARK: 设置阴影
    public func setShadow(color:CGColor? = UIColor.blackColor().CGColor, offset:CGSize? = CGSizeMake(0.25, 0.5), opacity:Float? = 0.15, radius:CGFloat? = 1.5) {
        if let v = color { self.layer.shadowColor = v }
        if let v = offset { self.layer.shadowOffset = v }
        if let v = opacity { self.layer.shadowOpacity = v }
        if let v = radius { self.layer.shadowRadius = v }
    }
    //MARK: 兼容Objective－C
    public func setShadowOC(color:CGColor, offset:CGSize, opacity:Float, radius:CGFloat) {
        self.setShadow(color, offset: offset, opacity: opacity, radius: radius)
    }
    
    //MARK: 动态全屏  触摸消失
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

