//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

import Extension

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
            .backgroundColor(.white)

        let attrbuteString = NSMutableAttributedString(string: "hello")
            .foregroundColor(.red)
            .underlineColor(.blue)
            .underlineStyle(.single)

        let label = UILabel()
            .frame(CGRect(x: 80, y: 200, width: 200, height: 20))
            .backgroundColor(.white)
            .textAlignment(.center)
            .numberOfLines(2)
            .lineBreakMode(.byTruncatingMiddle)
            .attributedText(attrbuteString)

        view.addSubview(label)
        self.view = view
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
