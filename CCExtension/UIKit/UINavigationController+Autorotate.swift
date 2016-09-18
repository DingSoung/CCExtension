//  Created by Songwen Ding on 8/6/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import UIKit

public extension UINavigationController {
    
    // 兼容iOS旋转问题 http://stackoverflow.com/questions/19817646/autorotation-not-working-in-ios-7-works-fine-in-ios-6
    open override var shouldAutorotate: Bool {
        get {
            if let autoTotate = self.viewControllers.last?.shouldAutorotate {
                return autoTotate
            } else {
                return super.shouldAutorotate
            }
        }
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get {
            if let orientation = self.viewControllers.last?.preferredInterfaceOrientationForPresentation {
                return orientation
            } else {
                return super.preferredInterfaceOrientationForPresentation
            }
        }
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            if let orientation = self.viewControllers.last?.supportedInterfaceOrientations {
                return orientation
            } else {
                return super.supportedInterfaceOrientations
            }
        }
    }
    
    
//    public override func shouldAutorotate() -> Bool {
//        if let autoTotate = self.viewControllers.last?.shouldAutorotate() {
//            return autoTotate
//        } else {
//            return super.shouldAutorotate();
//        }
//    }
    

//    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        if let orientation = self.viewControllers.last?.supportedInterfaceOrientations {
//            return orientation
//        } else {
//            return super.supportedInterfaceOrientations
//        }
//    }
    

    
//    public override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
//        if let orientation = self.viewControllers.last?.preferredInterfaceOrientationForPresentation {
//            return orientation
//        } else {
//            return super.preferredInterfaceOrientationForPresentation
//        }
//    }
}
