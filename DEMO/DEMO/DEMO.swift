//
//  DEMO.swift
//  DEMO
//
//  Created by Songwen Ding on 8/22/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import Foundation

public class DEMO: NSObject {
    
    class public func testSwiftTools() -> Void {
        
        closure("test", run: true, block: {
            print("test block")
        }) {
            print("test block finished")
        }
        
        let anObj:NSObject = NSObject()
        synchronized(anObj) {
            // 在括号内 anObj 不会被其他线程改变
            print(anObj.hash)
        }
    }
    
}