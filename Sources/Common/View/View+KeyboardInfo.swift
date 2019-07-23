//  Created by Songwen on 2018/11/14.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(UIKit) && os(iOS)
import UIKit

extension View {
    @objc
    public enum KeyboardAction: Int {
        case hide = 0
        case show = 1
    }

    @objc(UIViewKeyboardInfo) @objcMembers
    public final class KeyboardInfo: NSObject {
        public var frame: CGRect {
            return frameEnd
        }
        public var duration: TimeInterval = 0
        public var option: View.AnimationOptions {
            return View.AnimationOptions.init(rawValue: self.curve << 16)
        }
        public var action: KeyboardAction {
            return frameEnd.maxY > UIScreen.main.bounds.maxY ? .hide : .show
        }
        // internal status
        private var frameBegin = CGRect.zero
        private var frameEnd = CGRect.zero
        private var curve: UInt = 0
        // view block holder
        fileprivate var weakArray = NSHashTable<AnyObject>(options: .weakMemory)
        // singleton
        public static let shared = KeyboardInfo()

        private override init() {
            super.init()
        }

        deinit {
            invalid()
        }
    }
}

extension View.KeyboardInfo {
    /// active
    public func active() {
        [UIResponder.keyboardWillChangeFrameNotification].forEach { (name) in
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(updateKeyboardInfo(notification:)),
                                                   name: name,
                                                   object: nil)
        }
    }
    /// invalid
    public func invalid() {
        [UIResponder.keyboardWillChangeFrameNotification].forEach { (name) in
            NotificationCenter.default.removeObserver(self, name: name, object: nil)
        }
    }
}

extension View.KeyboardInfo {
    // MARK: - Notification
    @objc
    private func updateKeyboardInfo(notification: Notification) {
        guard let frameBegin = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect,
            let frameEnd = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt
            else { return }
        self.frameBegin = frameBegin
        self.frameEnd = frameEnd
        self.duration = duration
        self.curve = curve
        self.weakArray.allObjects.forEach { (object) in
            (object as? View)?.keyboardInfoDidUpdateCallBack?(self)
        }
    }
}

extension View {
    private static var keyboardInfoDidUpdateCallBackKey: UInt8 = 0
    /// keyboard frame update callback
    @objc
    public var keyboardInfoDidUpdateCallBack: ((KeyboardInfo) -> Swift.Void)? {
        set {
            if newValue != nil {
                KeyboardInfo.shared.weakArray.add(self)
            } else {
                KeyboardInfo.shared.weakArray.remove(self)
            }
            if KeyboardInfo.shared.weakArray.count > 0 {
                KeyboardInfo.shared.active()
            } else {
                KeyboardInfo.shared.invalid()
            }
            objc_setAssociatedObject(self,
                                     &UIView.keyboardInfoDidUpdateCallBackKey,
                                     newValue,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self,
                                            &UIView.keyboardInfoDidUpdateCallBackKey)
                as? (KeyboardInfo) -> Swift.Void
        }
    }
}
#endif
