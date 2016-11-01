//
//  ViewController.swift
//  DEMO-Swift
//
//  Created by Songwen Ding on 10/31/16.
//  Copyright © 2016 DingSoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderAction(_ sender: UISlider) {
        print(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swizzleMethod()
        
        print(UIApplication.shared.description) // Check original description
        swizzleEmAll()
        print(UIApplication.shared.description) //Check that swizzling works
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func swizzleEmAll() {
        method_exchangeImplementations(class_getInstanceMethod(UIApplication.self, #selector(UIApplication.description)),
                                       class_getInstanceMethod(UIApplication.self, #selector(UIApplication.myDescription)))
        
        method_exchangeImplementations(class_getInstanceMethod(UIApplication.self, #selector(UIApplication.sendAction(_:to:from:for:))),
                                       class_getInstanceMethod(UIApplication.self, #selector(UIApplication.hook_sendAction(_:to:from:for:))))
    }
    
    
    func swizzleMethod(){
        let method:Method = class_getInstanceMethod(object_getClass(self), Selector("systemfunc"))
        let swizzledMethod:Method = class_getInstanceMethod(object_getClass(self), Selector("myfunc"))
        
        self.systemfunc()
        self.myfunc()
        
        method_exchangeImplementations(method, swizzledMethod)
        
        self.systemfunc()
        self.myfunc()
    }
    func systemfunc(){
        print("system func log")
    }
    func myfunc() {
        print("my func log")
    }
}


extension UIApplication {
    open func hook_sendAction(_ action: Selector, to target: Any?, from sender: Any?, for event: UIEvent?) -> Bool {
        print("----------Application sendAction hooked")
        return self.hook_sendAction(action, to: target, from: sender, for: event)
    }
    
    func myDescription() -> String!{
        return " -------  Hooooked" + myDescription();
    }
}

