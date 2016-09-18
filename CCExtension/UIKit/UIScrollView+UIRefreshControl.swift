//  Created by Songwen Ding on 4/18/16.
//  Copyright © 2016 DingSoung. All rights reserved.

/*
 extension store property via objc runtime Associated Objects http://nshipster.com/swift-objc-runtime/
 closure to anyobject http://stackoverflow.com/questions/28211973/swift-closure-as-anyobject
 */

import UIKit

import ObjectiveC

/*
extension UIScrollView {
    
    private struct cc_refreshAssociatedKeys {
        static var cc_refreshControl = "cc_refreshControl"
        static var cc_refreshClosure = "cc_refreshClosure"
    }
    
    public func cc_refreashInit() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.cc_refreshControlAction), for: UIControlEvents.valueChanged)
        objc_setAssociatedObject(self,
                                 &cc_refreshAssociatedKeys.cc_refreshControl,
                                 refreshControl,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    public var cc_refreshControl: UIRefreshControl? {
        get {
            guard let refreashControl  = objc_getAssociatedObject(self, &cc_refreshAssociatedKeys.cc_refreshControl) as? UIRefreshControl else {
                return nil
            }
            return refreashControl
        }
        set {
            if let value = newValue {
                objc_setAssociatedObject(self,
                                         &cc_refreshAssociatedKeys.cc_refreshControl,
                                         value,
                                         objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                objc_removeAssociatedObjects(self) // clear all
            }
        }
    }
    
    private typealias cc_ConventionBlock = @convention(block) ()->()
    public var cc_refreshClosure: (()->())? {
        get {
            let closureObject = objc_getAssociatedObject(self, &cc_refreshAssociatedKeys.cc_refreshClosure)
            let closure =  unsafeBitCast(closureObject, to: cc_ConventionBlock.self)
            return closure as ()->()
        }
        set {
            if let closure = newValue {
                let closureObject = unsafeBitCast(closure as cc_ConventionBlock, to: AnyObject.self)
                objc_setAssociatedObject(self,
                                         &cc_refreshAssociatedKeys.cc_refreshClosure,
                                         closureObject,
                                         objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    func cc_refreshControlAction() {
        self.cc_refreshClosure?()
    }
    
    //self.cc_refreshControl?.beginRefreshing()
    //self.refreshControl?.endRefreshing()
}
 */
