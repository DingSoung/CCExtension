//  Created by Songwen Ding on 2017/8/9.
//  Copyright © 2017年 DingSoung. All rights reserved.

#if canImport(UIKit)
import UIKit

extension UITableView {
    public final var headerImage: UIImage? {
        let offset = contentOffset
        guard let rect = tableHeaderView?.frame else {return nil}
        scrollRectToVisible(rect, animated: false)
        let image = tableHeaderView?.image
        setContentOffset(offset, animated: false)
        return image
    }
    public final func headerImage(forSection section: Int) -> UIImage? {
        let offset = contentOffset
        let rect = rectForHeader(inSection: section)
        scrollRectToVisible(rect, animated: false)
        let image = headerView(forSection: section)?.image
        setContentOffset(offset, animated: false)
        return image
    }
    public final func imageForRow(at indexPath: IndexPath) -> UIImage? {
        let offset = contentOffset
        scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: false)
        let image = cellForRow(at: indexPath)?.image(scale: UIScreen.main.scale)
        setContentOffset(offset, animated: false)
        return image
    }
    public final func footerImage(forSection section: Int) -> UIImage? {
        let offset = contentOffset
        let rect = rectForFooter(inSection: section)
        scrollRectToVisible(rect, animated: false)
        let image = headerView(forSection: section)?.image
        setContentOffset(offset, animated: false)
        return image
    }
    public final var footerImage: UIImage? {
        let offset = contentOffset
        guard let rect = tableFooterView?.frame else {return nil}
        scrollRectToVisible(rect, animated: false)
        let image = tableHeaderView?.image
        setContentOffset(offset, animated: false)
        return image
    }
    public final func render(context: CGContext,
                             section: Int,
                             fromRow start: Int,
                             to end: Int,
                             withHeader header: Bool = false,
                             footer: Bool = false) -> Swift.Void {
        context.saveGState()
        let offset = contentOffset
        if header == true {
            let rect = rectForHeader(inSection: section)
            scrollRectToVisible(rect, animated: false)
            if let view = headerView(forSection: section) {
                scrollRectToVisible(view.frame, animated: false)
                view.layer.render(in: context)
                context.concatenate(CGAffineTransform(translationX: 0, y: rect.size.height))
            }
        }
        for row in start..<end {
            let indexPath = IndexPath(row: row, section: section)
            scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: false)
            if let cell = cellForRow(at: indexPath) {
                cell.layer.render(in: context) // +1.6~1.8MB
                context.concatenate(CGAffineTransform(translationX: 0, y: cell.bounds.size.height))
            } else {
                // draw empty
            }
        }
        if footer == true {
            let rect = rectForFooter(inSection: section)
            scrollRectToVisible(rect, animated: false)
            if let view = footerView(forSection: section) {
                scrollRectToVisible(view.frame, animated: false)
                view.layer.render(in: context)
                context.concatenate(CGAffineTransform(translationX: 0, y: rect.size.height))
            }
        }
        setContentOffset(offset, animated: false)
        context.restoreGState()
    }
    /// ⚠️ hight memory require when lines > 100, get image for one section
    public final func imageForSection(at section: Int,
                                      fromRow start: Int,
                                      to end: Int,
                                      totalHeight: CGFloat,
                                      withHeader header: Bool = false,
                                      footer: Bool = false) -> UIImage? {
        var height = totalHeight
        if header == true {
            height += rectForHeader(inSection: section).size.height
        }
        if footer == true {
            height += rectForFooter(inSection: section).size.height
        }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: contentSize.width, height: height),
                                               false,
                                               UIScreen.main.scale) // +224.25MB
        if let context = UIGraphicsGetCurrentContext() {
            render(context: context, section: section, fromRow: start, to: end, withHeader: header, footer: footer)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext(); //-245.3M
        return image
    }
    /// ⚠️ hight memory require when lines > 20, get image from section and all rows in it
    public final func imageFromSection(_ start: Int, to end: Int, withHeader header: Bool, footer: Bool) -> UIImage? {
        var images: [UIImage] = []
        if let herderImage = headerImage, header == true {
            images.append(herderImage)
        }
        for section in start..<end {
            let totalHeight = { () -> CGFloat in
                var height: CGFloat = 0
                let rows = numberOfRows(inSection: section)
                for row in 0..<rows {
                    height += rectForRow(at: IndexPath(row: row, section: section)).size.height
                }
                return height
            }()
            if let image = imageForSection(at: section,
                                           fromRow: 0,
                                           to: numberOfRows(inSection: section),
                                           totalHeight: totalHeight,
                                           withHeader: true,
                                           footer: true) {
                images.append(image)
                if images.count > 5 {
                    if let image = images.verticalImage {
                        images.removeAll() //? release memory?
                        images.append(image)
                    }
                }
            }
        }
        if let image = footerImage, footer == true {
            images.append(image)
        }
        let image = images.verticalImage
        images.removeAll()
        return image
    }
}
#endif
