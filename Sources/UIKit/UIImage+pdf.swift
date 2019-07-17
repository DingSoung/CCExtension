//  Created by Songwen Ding on 2018/12/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(UIKit)
import UIKit

extension UIImage {
    private static var ramCache = NSCache<NSString, UIImage>()

    public class final func image(pdf: String, bundle: Bundle, page: Int, size: CGSize) -> UIImage? {
        guard size.width > 0 && size.height > 0 && page > 0 else { return nil }
        guard let filePath = bundle.path(forResource: pdf, ofType: "pdf") else { return nil }
        let name = cacheName(filePath: filePath, page: page, size: size)
        // use cache
        if let image = ramCache.object(forKey: name as NSString) { return image }
        // render
        guard let pdf = CGPDFDocument(NSURL.fileURL(withPath: filePath) as CFURL) else { return nil }
        guard page > pdf.numberOfPages else { return nil }
        guard let pdfPage = pdf.page(at: page) else { return nil }
        guard let image = image(pdfPage: pdfPage, size: size) else { return nil }
        // cache
        ramCache.setObject(image, forKey: name as NSString)
        return image
    }

    /// struct cache name
    private final class func cacheName(filePath: String, page: Int, size: CGSize) -> String {
        let fileParameter = "-\(page)-\(size.width)-\(size.height)"
        do {
            let fileAttrbutes = try FileManager.default.attributesOfItem(atPath: filePath)
            return filePath
                + fileParameter
                + "-\(fileAttrbutes[FileAttributeKey.size].debugDescription))"
                + "-\(fileAttrbutes[FileAttributeKey.modificationDate].debugDescription)"
                + ".png"
        } catch {
            return filePath + fileParameter + ".png"
        }
    }

    /// render image
    private final class func image(pdfPage: CGPDFPage, size: CGSize) -> UIImage? {
        let pageFrame = pdfPage.getBoxRect(CGPDFBox.cropBox)
        let screenScale = UIScreen.main.scale // pix per bitMap @2x or @3x
        guard let context = CGContext(data: nil,
                                      width: Int(size.width * screenScale),
                                      height: Int(size.height * screenScale),
                                      bitsPerComponent: 8,
                                      bytesPerRow: 0,
                                      space: CGColorSpaceCreateDeviceRGB(),
                                      bitmapInfo: CGBitmapInfo.byteOrder32Little.rawValue
                                        | CGImageAlphaInfo.premultipliedFirst.rawValue)
            else {return nil}
        // scale pix / bit map
        context.scaleBy(x: screenScale, y: screenScale)
        // target size scale file
        context.scaleBy(x: size.width / pageFrame.size.width, y: size.height / pageFrame.size.height)
        // transform
        context.translateBy(x: -pageFrame.origin.x, y: -pageFrame.origin.y)
        // rendering pdf
        context.drawPDFPage(pdfPage)
        guard let imageRef = context.makeImage() else {
            return nil
        }
        return UIImage(cgImage: imageRef, scale: screenScale, orientation: .up)
    }
}

#endif
