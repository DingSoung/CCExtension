//
//  UIControl+Event.swift
//  Extension
//
//  Created by Songwen Ding on 2019/7/17.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UIControl {
    // TODO: different action for controlEvent
    typealias Action = () -> Void
    private static let association = Association<Action>()
    private var action: Action? {
        set { UIControl.association[self] = newValue }
        get { return UIControl.association[self] }
    }
    @objc private func triggerActionHandler() {
        action?()
    }
    public final func setEvent(event: Event, withAction action: (() -> Void)?) {
        self.action = action
        removeTarget(self, action: #selector(triggerActionHandler), for: event)
        if action != nil {
            addTarget(self, action: #selector(triggerActionHandler), for: event)
        }
    }
}
#endif
