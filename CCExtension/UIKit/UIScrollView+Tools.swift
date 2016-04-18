//
//  UIScrollView+Tools.swift
//  DEMO
//
//  Created by Songwen Ding on 4/18/16.
//  Copyright © 2016 Alex. All rights reserved.
//

/*
 refrense 
 http://nshipster.com/associated-objects/
 http://stackoverflow.com/questions/25426780/swift-extension-stored-properties-alternative
 */

import UIKit

import ObjectiveC
private var cc_refreshBlockAssociationKey: UInt8 = 0

extension UIScrollView {
    
    public var cc_refreshBlock:NSObject? {
        get {
            return objc_getAssociatedObject(self, &cc_refreshBlockAssociationKey) as? NSObject
        }
        set(newValue) {
            objc_setAssociatedObject(self, &cc_refreshBlockAssociationKey, cc_refreshBlock, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    public var cc_refreshControl:UIRefreshControl? {
        if (self.cc_refreshControl != nil) {
            return self.cc_refreshControl
        } else {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(UIScrollView.cc_refreshControlAction), forControlEvents: UIControlEvents.ValueChanged)
            return refreshControl
        }
    }
    
    @objc private func cc_refreshControlAction() {
        //self.cc_refreshBlock?()
    }
    
    //self.cc_refreshControl?.beginRefreshing()
    //self.refreshControl?.endRefreshing()
    
}
