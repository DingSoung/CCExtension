//  Created by Songwen Ding on 2017/8/9.
//  Copyright © 2017年 DingSoung. All rights reserved.

import UIKit

extension UITableView {
    
    public final var headerImage: UIImage? {
        let offset = self.contentOffset
        guard let rect = self.tableHeaderView?.frame else {return nil}
        self.scrollRectToVisible(rect, animated: false)
        let image = self.tableHeaderView?.image
        self.setContentOffset(offset, animated: false)
        return image
    }
    
    public final func headerImage(forSection section:Int) -> UIImage? {
        let offset = self.contentOffset
        let rect = self.rectForHeader(inSection: section)
        self.scrollRectToVisible(rect, animated: false)
        let image = self.headerView(forSection: section)?.image
        self .setContentOffset(offset, animated: false)
        return image
    }
    
    public final func imageForRow(at indexPath:IndexPath) -> UIImage? {
        var image:UIImage? = nil
        let offset = self.contentOffset
        self.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: false)
        image = self.cellForRow(at: indexPath)?.image(alpha: 1)
        self .setContentOffset(offset, animated: false)
        return image
    }
    
    public final func footerImage(forSection section:Int) -> UIImage? {
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
    
    public final func imageForSection(at section:Int, fromRow start:Int, to end:Int, withHeader header:Bool, footer:Bool) -> UIImage? {
        var images:[UIImage] = []
        if let image = self.headerImage(forSection: section), header == true {
            images.append(image)
        }
        for row in start..<end {
            //autoreleasepool {
            if let image = self.imageForRow(at: IndexPath(row: row, section: section)) {
                images.append(image)
                if images.count > 20 {
                    if let image = images.verticalImage {
                        images.removeAll() //? release memory?
                        images.append(image)
                    }
                }
            }
            //}
        }
        if let image = self.footerImage(forSection: section), footer == true {
            images.append(image)
        }
        let image = images.verticalImage
        images.removeAll()
        return image
    }
    
    public final func imageFromSection(_ start:Int, to end:Int, withHeader header:Bool, footer:Bool) -> UIImage? {
        var images:[UIImage] = []
        if let herderImage = self.headerImage, header == true {
            images.append(herderImage)
        }
        for section in start..<end {
            //autoreleasepool {
            if let image = self.imageForSection(at: section,
                                                fromRow: 0,
                                                to: self.numberOfRows(inSection: section),
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
            //}
        }
        if let image = self.footerImage, footer == true {
            images.append(image)
        }
        let image = images.verticalImage
        images.removeAll()
        return image
    }
}
