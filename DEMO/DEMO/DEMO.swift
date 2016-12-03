//
//  DEMO.swift
//  DEMO
//
//  Created by Songwen Ding on 8/22/16.
//  Copyright © 2016 DingSoung. All rights reserved.
//

import Foundation

public class DEMO: NSObject {
    
    class public func testSwiftTools() -> Void {
        
        closure(mark: "test", run: true, block: {
            print(log: "ddddd")
            print("test block")
        }) {
            print("test block finished")
        }
        
        let anObj:NSObject = NSObject()
        synchronized(lock: anObj) {
            // 在括号内 anObj 不会被其他线程改变
            print(anObj.hash)
        }
        
        
        
        
        printssss(sssss, separator: <#T##String#>, terminator: <#T##String#>)
    }
    
}
