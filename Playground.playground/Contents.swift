//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

import Extension

class MyViewController : UIViewController {
    override func loadView() {
        // Chainable 链式调用
        let view = UIView()
            .backgroundColor(.white)
        self.view = view
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
        // Color hex and css
        _ = Color.red.components
        _ = Color.aliceblue.hex8
        _ = Color.aliceblue.hex8String
        _ = Color.css("lemonchiffon")
        _ = Color.lemonchiffon
        _ = Color.hex("#777777")
        _ = Color(hex8: 0xAABBCCDD)
        // Image
        let imageView = UIImageView()
        view.addSubview(imageView)
        let originImage = Image.image(render: {
            let ovalPath = UIBezierPath(ovalIn: CGRect(x:0, y:0, width:5, height:5))
            UIColor.white.setFill()
            ovalPath.fill()
        }, size: CGSize(width: 10, height: 10), opaque: true)
        _ = Image.image(pdf: "ok",
                        bundle: Bundle.main,
                        page: 0,
                        size: imageView.frame.size)
        _ = originImage?.image(scale: 0.8)
        _ = originImage?.image(ratio: 2)
        _ = originImage?.image(size: CGSize(width: 10, height: 20))
        _ = originImage?.image(radius: 5)
        _ = originImage?.roundImage
        imageView.image = originImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // runtime
        let button = UIButton()
        view.addSubview(button)
        let action = selector(uid: view.hash.description,types: "v@:", classes: [UIView.self]) {
            print("cation")
        }
        button.addTarget(button, action: action, for: .touchUpInside)
        // Dispatch once
        DispatchQueue.main.once {
            print("hello")
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
