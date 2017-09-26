//  Created by Songwen Ding on 2017/8/9.
//  Copyright © 2017年 DingSoung. All rights reserved.

#if os(iOS)
import UIKit

@objc
extension UITableView {

    public final var headerImage: UIImage? {
        let offset = self.contentOffset
        guard let rect = self.tableHeaderView?.frame else {return nil}
        self.scrollRectToVisible(rect, animated: false)
        let image = self.tableHeaderView?.image
        self.setContentOffset(offset, animated: false)
        return image
    }

    public final func headerImage(forSection section: Int) -> UIImage? {
        let offset = self.contentOffset
        let rect = self.rectForHeader(inSection: section)
        self.scrollRectToVisible(rect, animated: false)
        let image = self.headerView(forSection: section)?.image
        self .setContentOffset(offset, animated: false)
        return image
    }

    public final func imageForRow(at indexPath: IndexPath) -> UIImage? {
        let offset = self.contentOffset
        self.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
        let image = self.cellForRow(at: indexPath)?.image(scale: UIScreen.main.scale)
        self.setContentOffset(offset, animated: false)
        return image
    }

    public final func footerImage(forSection section: Int) -> UIImage? {
        let offset = self.contentOffset
        let rect = self.rectForFooter(inSection: section)
        self.scrollRectToVisible(rect, animated: false)
        let image = self.headerView(forSection: section)?.image
        self .setContentOffset(offset, animated: false)
        return image
    }

    public final var footerImage: UIImage? {
        let offset = self.contentOffset
        guard let rect = self.tableFooterView?.frame else {return nil}
        self.scrollRectToVisible(rect, animated: false)
        let image = self.tableHeaderView?.image
        self.setContentOffset(offset, animated: false)
        return image
    }

    public final func render(context: CGContext,
                             section: Int,
                             fromRow start: Int,
                             to end: Int,
                             withHeader header: Bool,
                             footer: Bool) -> Swift.Void {
        context.saveGState()
        let offset = self.contentOffset
        if header == true {
            let rect = self.rectForHeader(inSection: section)
            self.scrollRectToVisible(rect, animated: false)
            if let view = self.headerView(forSection: section) {
                self.scrollRectToVisible(view.frame, animated: false)
                view.layer.render(in: context)
                context.concatenate(CGAffineTransform(translationX: 0, y: rect.size.height))
            }
        }
        for row in start..<end {
            let indexPath = IndexPath(row: row, section: section)
            self.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
            if let cell = self.cellForRow(at: indexPath) {
                cell.layer.render(in: context) // +1.6~1.8MB
                context.concatenate(CGAffineTransform(translationX: 0, y: cell.bounds.size.height))
            } else {
                // draw empty
            }
        }
        if footer == true {
            let rect = self.rectForFooter(inSection: section)
            self.scrollRectToVisible(rect, animated: false)
            if let view = self.footerView(forSection: section) {
                self.scrollRectToVisible(view.frame, animated: false)
                view.layer.render(in: context)
                context.concatenate(CGAffineTransform(translationX: 0, y: rect.size.height))
            }
        }
        self.setContentOffset(offset, animated: false)
        context.restoreGState()
    }

    /// ⚠️ hight memory require when lines > 100, get image for one section
    public final func imageForSection(at section: Int,
                                      fromRow start: Int,
                                      to end: Int,
                                      totalHeight: CGFloat,
                                      withHeader header: Bool,
                                      footer: Bool) -> UIImage? {
        var height = totalHeight
        if header == true {
            height += self.rectForHeader(inSection: section).size.height
        }
        if footer == true {
            height += self.rectForFooter(inSection: section).size.height
        }
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.contentSize.width,
                                                      height: height),
                                               false,
                                               UIScreen.main.scale) // +224.25MB
        if let context = UIGraphicsGetCurrentContext() {
            self.render(context: context, section: section, fromRow: start, to: end, withHeader: header, footer: footer)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext(); //-245.3M
        return image
    }

    /// ⚠️ hight memory require when lines > 20, get image from section and all rows in it
    public final func imageFromSection(_ start: Int, to end: Int, withHeader header: Bool, footer: Bool) -> UIImage? {
        var images: [UIImage] = []
        if let herderImage = self.headerImage, header == true {
            images.append(herderImage)
        }
        for section in start..<end {
            let totalHeight = { () -> CGFloat in
                var height: CGFloat = 0
                let rows = self.numberOfRows(inSection: section)
                for row in 0..<rows {
                    height += self.rectForRow(at: IndexPath(row: row, section: section)).size.height
                }
                return height
            }()
            if let image = self.imageForSection(at: section,
                                                fromRow: 0,
                                                to: self.numberOfRows(inSection: section),
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
        if let image = self.footerImage, footer == true {
            images.append(image)
        }
        let image = images.verticalImage
        images.removeAll()
        return image
    }
}
#endif
