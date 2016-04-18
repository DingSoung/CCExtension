//
//  CCPDFImage.swift
//  DEMO
//
//  Created by Songwen Ding on 4/14/16.
//  Copyright © 2016 ifnil. All rights reserved.
//

import UIKit

public class CCPDFImage: NSObject {
    static let instance = CCPDFImage()
    private var queue:dispatch_queue_t;
    
    private override init() {
        self.queue = dispatch_queue_create("com.dispatch.CCPDFImage", DISPATCH_QUEUE_SERIAL);
        
        super.init()
    }
    
    deinit {
        
    }
    
    public func generateImageWithPDF(url:String, size:CGSize, pageIndex:Int, success:((image:UIImage)->Void)?, fail:((error:NSError)->Void)?) -> Void {
        dispatch_sync(self.queue) {
            //get pdf file
            guard let path = NSBundle.mainBundle().pathForResource(url, ofType: "pdf") else {
                fail?(error: NSError(domain: "url error, file not found", code: -1, userInfo: nil))
                return
            }
            let URL = NSURL.fileURLWithPath(path)
            let pdf = CGPDFDocumentCreateWithURL(URL as CFURLRef)
            
            if (pageIndex >= 1 && pageIndex <= CGPDFDocumentGetNumberOfPages(pdf)) {
            } else {
                fail?(error: NSError(domain: "pageIndex error, out of range, should 1 ~ page.count", code: -2, userInfo: nil))
                return
            }
            
            // get page and frame
            let page = CGPDFDocumentGetPage(pdf, pageIndex)
            let pageFrame = CGPDFPageGetBoxRect(page, CGPDFBox.CropBox)
            
            let screenScale = UIScreen.mainScreen().scale // pix per bitMap @2x or @3x
            let context = CGBitmapContextCreate(nil,
                                                Int(size.width * screenScale),
                                                Int(size.height * screenScale),
                                                8,
                                                0,
                                                CGColorSpaceCreateDeviceRGB(),
                                                CGBitmapInfo.ByteOrderDefault.rawValue | CGImageAlphaInfo.PremultipliedLast.rawValue)
            
            // scale contex
            CGContextScaleCTM(context, screenScale, screenScale) // scale pix / bit map
            CGContextScaleCTM(context, size.width / pageFrame.size.width, size.height / pageFrame.size.height )  // target size scale file
            CGContextTranslateCTM(context, -pageFrame.origin.x, -pageFrame.origin.y)
            
            // rendering pdf
            CGContextDrawPDFPage(context, page);
            
            guard let imageRef = CGBitmapContextCreateImage(context) else {
                fail?(error: NSError(domain: "fail to render the target pdf source", code: -3, userInfo: nil))
                return
            }
            success?(image: UIImage(CGImage: imageRef, scale: screenScale, orientation: UIImageOrientation.Up))
        }
    }
}



