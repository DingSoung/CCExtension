//  Created by Songwen on 2018/11/14.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(UIKit) && os(iOS)
import UIKit

extension UIResponder {
    @objc(UIResponderKeyboardInfo)
    @objcMembers
    public final class Keyboard: NSObject {
        public var duration: TimeInterval = 0
        // internal status
        fileprivate var frameBegin = CGRect.zero
        fileprivate var frameEnd = CGRect.zero
        fileprivate var curve: UInt = 0
        // singleton
        public static let shared = Keyboard()
        private override init() {
            super.init()
        }
        deinit {
            invalid()
        }
    }
}

extension UIResponder.Keyboard {
    public var frame: CGRect {
        return frameEnd
    }
}

extension UIResponder.Keyboard {
    @objc
    public enum Action: Int {
        case hide = 0
        case show = 1
    }
    public var action: Action {
        return frameEnd.maxY > UIScreen.main.bounds.maxY ? .hide : .show
    }
}

extension UIResponder.Keyboard {
    public var option: View.AnimationOptions {
        return View.AnimationOptions.init(rawValue: curve << 16)
    }
}

extension UIResponder.Keyboard {
    private static let association = Association<NSMapTable<NSString, AnyObject>>()
    fileprivate var blocks: NSMapTable<NSString, AnyObject> {
        if let blocks = UIResponder.Keyboard.association[self] {
            return blocks
        } else {
            let blocks = NSMapTable<NSString, AnyObject>(keyOptions: .weakMemory, valueOptions: .weakMemory)
            UIResponder.Keyboard.association[self] = blocks
            return blocks
        }
    }

    public func addObserve(uid: String, updateBlock: @escaping UpdateBlock) {
        let object = unsafeBitCast(updateBlock, to: AnyObject.self)
        blocks.setObject(object, forKey: uid as NSString)
    }

    public func removeObserve(uid: String) {
        blocks.removeObject(forKey: uid as NSString)
    }
}

extension UIResponder.Keyboard {
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

extension UIResponder.Keyboard {
    public typealias UpdateBlock = @convention(block) (UIResponder.Keyboard) -> Void
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
        let enumerator = blocks.objectEnumerator()
        while let object: AnyObject = enumerator?.nextObject() as AnyObject? {
            let block = unsafeBitCast(object, to: UpdateBlock.self)
            block(self)
        }
    }
}

extension UIResponder {
    @objc
    public var keyboardUpdateBlock: Keyboard.UpdateBlock? {
        set {
            if let newValue = newValue {
                Keyboard.shared.addObserve(uid: hashValue.description, updateBlock: newValue)
            } else {
                Keyboard.shared.removeObserve(uid: hashValue.description)
            }
            if Keyboard.shared.blocks.count > 0 {
                Keyboard.shared.active()
            } else {
                Keyboard.shared.invalid()
            }
        }
        get {
            let object =  Keyboard.shared.blocks.object(forKey: hashValue.description as NSString)
            return unsafeBitCast(object, to: Keyboard.UpdateBlock.self)
        }
    }
}
#endif
