//
//  CCPDFImage.swift
//  DEMO
//
//  Created by Songwen Ding on 4/14/16.
//  Copyright © 2016 DingSoung. All rights reserved.
//

import UIKit

final public class CCPDFImage: NSObject {
    public static let instance = CCPDFImage()
    private var _queue:dispatch_queue_t;
    private override init() {
        _queue = dispatch_queue_create("com.dispatch.CCPDFImage", DISPATCH_QUEUE_CONCURRENT);
        super.init()
        self.useRamCache = true
    }
    
    deinit {
        _ramCache = nil;
    }
    
    private var _ramCache:NSCache?
    private var _useRamCache = false;
    public var useRamCache : Bool {
        set {
            _useRamCache = newValue;
            if newValue {
                if _ramCache == nil {
                    _ramCache = NSCache()
                }
            } else {
                _ramCache?.removeAllObjects()
            }
        }
        get {
            return _useRamCache;
        }
    }
    
    /// generate image at async quene and excuse block at main queue
    public final func asyncGetImage(resource:String, bundle:NSBundle, page:Int, size:CGSize, mainQueueBlock:((image:UIImage?)->Void)?) {
        dispatch_async(_queue, { [weak self] () -> Void in
            let image = self?.image(resource, bundle: bundle, page: page, size: size)
            dispatch_async(dispatch_get_main_queue(), {
                mainQueueBlock?(image: image)
            })
        })
    }
    
    public final func image(resource:String, bundle:NSBundle, page:Int, size:CGSize) -> UIImage? {
        if(CGSizeEqualToSize(size, CGSizeZero) || page <= 0) {
            return nil;
        }
        
        guard let filePath = bundle.pathForResource(resource, ofType: "pdf") else {
            return nil;
        }
        
        let cacheName = self.cacheName(filePath, page: page, size: size)
        if let image = _ramCache?.objectForKey(cacheName) as? UIImage {
            return image
        }
        
        let pdf = CGPDFDocumentCreateWithURL(NSURL.fileURLWithPath(filePath) as CFURLRef)
        if (page > CGPDFDocumentGetNumberOfPages(pdf)) {
            return nil
        }
        
        guard let image = self.image(pdf, page: page, size: size) else {
            return nil
        }
        
        if _useRamCache {
            _ramCache?.setObject(image, forKey: cacheName)
        }
        return image
    }
    
    /// struct cache name
    final private func cacheName(filePath:String, page:Int, size:CGSize) -> String {
        let fileParameter = "-\(page)-\(size.width)-\(size.height)"
        do {
            let fileAttrbutes = try NSFileManager.defaultManager().attributesOfItemAtPath(filePath)
            return filePath + fileParameter + "-\(fileAttrbutes[NSFileSize])-\(fileAttrbutes[NSFileModificationDate])" + ".png"
        } catch {
            return filePath + fileParameter + ".png"
        }
    }
    
    /// render image
    final private func image(pdf:CGPDFDocument?, page:Int, size:CGSize) -> UIImage? {
        let screenScale = UIScreen.mainScreen().scale // pix per bitMap @2x or @3x
        
        let pdfPage = CGPDFDocumentGetPage(pdf, page)
        let pageFrame = CGPDFPageGetBoxRect(pdfPage, CGPDFBox.CropBox)
        let context = CGBitmapContextCreate(nil,
                                            Int(size.width * screenScale),
                                            Int(size.height * screenScale),
                                            8,
                                            0,
                                            CGColorSpaceCreateDeviceRGB(),
                                            CGBitmapInfo.ByteOrderDefault.rawValue | CGImageAlphaInfo.PremultipliedFirst.rawValue)
        CGContextScaleCTM(context, screenScale, screenScale) // scale pix / bit map
        CGContextScaleCTM(context, size.width / pageFrame.size.width, size.height / pageFrame.size.height )  // target size scale file
        CGContextTranslateCTM(context, -pageFrame.origin.x, -pageFrame.origin.y) // transform
        CGContextDrawPDFPage(context, pdfPage); // rendering pdf
        
        guard let imageRef = CGBitmapContextCreateImage(context) else {
            return nil
        }
        return UIImage(CGImage: imageRef, scale: screenScale, orientation: UIImageOrientation.Up)
    }
}













