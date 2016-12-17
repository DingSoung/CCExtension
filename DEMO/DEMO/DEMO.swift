//
//  DEMO.swift
//  DEMO
//
//  Created by Songwen Ding on 8/22/16.
//  Copyright © 2016 DingSoung. All rights reserved.
//

import Foundation

public class TESTMODEL:NSObject {
    dynamic func printlog(title:String) {
        print("TESTMODEL print log:\(title)")
    }
}

public extension NSObject {
    dynamic class func printlog2(title:String) {
        print("TESTMODEL2 print log:\(title)")
    }
}


public class DEMO: NSObject {
    
    class public func testQueue() ->Void {
        let serialQueue = DispatchQueue(label: "test serial Queue")
        let currentQueue = DispatchQueue(label: "test current Queue", attributes:  DispatchQueue.Attributes.concurrent)
        
        serialQueue.sync {
            print("1") // thread 1 serial
            var a = 0
            a += 1;
        }
        print("1.")
        serialQueue.async {
            print("2") // thread 1 serial
            var array = [""]
            array.removeAll()
        }
        print("2.")
        currentQueue.sync {
            print("3")
            UserDefaults.standard.synchronize()
        }
        print("3.")
        currentQueue.async {
            print("4")
            exit(0)
        }
        print("4.")
    }
    
    
    
    
    
    class public func testSwiftTools() -> Void {
        
        closure(mark: "test", run: true, block: {
            print("test block")
        }) {
            print("test block finished")
        }
        
        let anObj:NSObject = NSObject()
        synchronized(lock: anObj) {
            // 在括号内 anObj 不会被其他线程改变
            print(anObj.hash)
        }
    }
    
    
    
    public func testSwizzle() {
        let test1 = TESTMODEL()
        test1.printlog(title: "before")
        
        let test2 = NSObject()
        TESTMODEL.printlog2(title: "before")
        
        
        let originalSelector = #selector(TESTMODEL.printlog(title:))
        let swizzledSelector = #selector(NSObject.printlog2(title:))
        let originalMethod = class_getInstanceMethod(TESTMODEL.self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(NSObject.self, swizzledSelector)
        
        if class_addMethod(TESTMODEL.self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)) {
            class_replaceMethod(TESTMODEL.self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            print("----------reseted")
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
            print("-----------Hooked")
        }
        
        test1.printlog(title: "after")
        TESTMODEL.printlog2(title: "after")
        
//        let originalSelector = #selector(DEMO.printlog(title:))
//        let swizzledSelector = #selector(DEMO.printlog2(title:))
//        let originalMethod = class_getInstanceMethod(DEMO.self, originalSelector)
//        let swizzledMethod = class_getInstanceMethod(DEMO.self, swizzledSelector)
//        method_exchangeImplementations(originalMethod, swizzledMethod)
        
        /*
        let test1 = TESTMODEL()
        test1.printlogTest(str: "test1 before")
        
        

        test1.startSwisss()
        
        
        test1.printlogTest(str: "test1 after")
         
        let test2 = TESTMODEL()
        test2.printlogTest(str: "test2 after")
        
        test2.printlogTest(str: "test2 after")
         */
    }
    
}
