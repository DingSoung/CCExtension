//
//  UIImageView+PDF.swift
//  DEMO
//
//  Created by Songwen Ding on 4/14/16.
//  Copyright © 2016 ifnil. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// async set image with pdf file
    public func setImageVithPDF(url:String, size:CGSize, pageIndex:Int, success:((image:UIImage)->Void)?, fail:((error:NSError)->Void)?) -> Void {
        CCPDFImage.instance.generateImageWithPDF(url, size: size, pageIndex: pageIndex, success: { (image) in
            self.image = image;
            }, fail: fail)
    }
    /// async set image with pdf file
    public func setImageWithPDF(url:String) -> Void {
        self.setImageVithPDF(url, size: self.bounds.size, pageIndex: 1, success: nil, fail: nil)
    }
}