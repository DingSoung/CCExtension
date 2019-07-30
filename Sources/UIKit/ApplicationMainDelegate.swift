//  Created by Songwen Ding on 2019/3/21.
//  Copyright © 2019 Songwen Ding. All rights reserved.

#if canImport(UIKit)
import UIKit

open class ApplicationMianDelegate: UIResponder {
    open var modules: [UIApplicationDelegate] {
        fatalError("override this")
    }
}

extension ApplicationMianDelegate: UIApplicationDelegate {
    open func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        return modules.allSatisfy {
            return $0.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true
        }
    }

    open func applicationWillResignActive(_ application: UIApplication) {
        modules.forEach {
            $0.applicationWillResignActive?(application)
        }
    }

    open func applicationDidEnterBackground(_ application: UIApplication) {
        modules.forEach {
            $0.applicationDidEnterBackground?(application)
        }
    }

    open func applicationWillEnterForeground(_ application: UIApplication) {
        modules.forEach {
            $0.applicationWillEnterForeground?(application)
        }
    }

    open func applicationDidBecomeActive(_ application: UIApplication) {
        modules.forEach {
            $0.applicationDidBecomeActive?(application)
        }
    }

    open func applicationWillTerminate(_ application: UIApplication) {
        modules.forEach {
            $0.applicationWillTerminate?(application)
        }
    }
}
#endif
