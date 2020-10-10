//  Created by Songwen Ding on 8/6/16.
//  Copyright © 2016 DingSoung. All rights reserved.

#if canImport(UIKit) && os(iOS)
import UIKit

extension UINavigationController {
    // 兼容iOS旋转问题 http://stackoverflow.com/questions/19817646/autorotation-not-working-in-ios-7-works-fine-in-ios-6
    open override var shouldAutorotate: Bool {
        if let autoTotate = viewControllers.last?.shouldAutorotate {
            return autoTotate
        } else {
            return super.shouldAutorotate
        }
    }
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let orientation = viewControllers.last?.preferredInterfaceOrientationForPresentation {
            return orientation
        } else {
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let orientation = viewControllers.last?.supportedInterfaceOrientations {
            return orientation
        } else {
            return super.supportedInterfaceOrientations
        }
    }
}
#endif
