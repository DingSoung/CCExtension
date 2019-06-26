//  Created by Songwen Ding on 10/28/16.
//  Copyright © 2016 Alex. All rights reserved.

#if os(iOS)
import UIKit

extension UIApplication {
    @objc func hook_sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        return hook_sendAction(action, to: target, from: sender, for: event)
    }

    public final class func switchHook() {
        exchange(#selector(sendAction(_:to:from:for:)),
                 in: UIApplication.self,
                 with: #selector(hook_sendAction(_:to:from:for:)),
                 in: UIApplication.self)
    }
}
#endif
