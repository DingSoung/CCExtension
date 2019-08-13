![Release](https://img.shields.io/github/release/DingSoung/Extension.svg)
![Status](https://travis-ci.org/DingSoung/Extension.svg?branch=master)

![SwiftPackage](https://img.shields.io/badge/SwiftPackage-compatible-E66848.svg?style=flat)

![Language](https://img.shields.io/badge/Swift-5-FFAC45.svg?style=flat)
![Platform](http://img.shields.io/badge/Platform-iOS|tvOS|macOS|watchOS-E9C2BD.svg?style=flat)

[![Donate](https://img.shields.io/badge/Donate-PayPal-9EA59D.svg)](https://paypal.me/DingSongwen)

# 简介

 各种 Swift Extension  扩展合集

# 按照

#### Swift Package Manager

```swift
"https://github.com/DingSoung/Extension", master
```

### # 模块

## Chainable 链式调用

```swift
let attrbuteString = NSMutableAttributedString(string: "hello")
    .foregroundColor(.red)
    .underlineColor(.blue)
    .underlineStyle(.single)

let label = UILabel()
    .backgroundColor(.white)
    .textAlignment(.center)
    .numberOfLines(2)
    .lineBreakMode(.byTruncatingMiddle)
    .attributedText(attrbuteString)
```

**欢迎补充**

- [ ] UIView
- [ ] UILabel
- [ ] NSMutableAttributedString
- [ ] NSMutableParagraph
- [ ] CALayer

## Color hex and css 

```swift
let components = UIColor.red.components

let hex1 = UIColor.red.hex8

let hex2 = UIColor.red.hex8String

let color1 = Color.css("lemonchiffon")

let color3 = Color.hex("#777777")

let color3 = Color(hex8: 0xAABBCCDD)

let color4 = Color(red: 0, green: 127, blue: 255, alpha: 255)
```

## Image

```swift
let image1 = Image.image(render: {
    let ovalPath = UIBezierPath(ovalIn: CGRect(x:0, y:0, width:5, height:5))
    UIColor.white.setFill()
    ovalPath.fill()
}, size: CGSize(width: 10, height: 10), opaque: true)

let image2 = Image.image(pdf: "ok",
                         bundle: UIBundle.main,
                         page: 0,
                         size: imageView.frame.size)

let image3 = originImage.image(scale: 0.8)

let image4 = originImage.image(ratio: 2)

let image5 = originImage.image(size: CGSize(width: 10, height: 20))

let image6 = originImage.image(radius: 5)

let image7 = originImage.roundImage
```

## runtime

new selector

```swift
let button = UIButton()
let selector = selector(uid: view.hash.description, types: "v@:", classes: [UIView.self]) {
    print("cation")
}
button.addTarget(button, action: selector, for: .touchUpInside)
```

* add selector

* replace selector

* exchange selector

* get all methods

* check exists selector in class

## View 

work with keyboard

```swift
let view = UIView()
view.keyboardInfoDidUpdateCallBack = { info in
    UIView.animate(withDuration: info.duration,
                   delay: 0,
                   options: info.option,
                   animations: {
                    view.frame.origin.y = info.frame.origin.y - 200
    }, completion: nil)
}
```

convert to image

```swift
let view = UIView()
let image = view.image(alpha: 0.8, bounds: view.bounds, scale: 0.5)
```

## Dispatch once

```swift
DispatchQueue.main.once {
	print("hello")
}
```

- [x] userdefault

- [x] http cookie

- [x] CFAbsoluteTime

- [x] bundle localizationCode

- [x] Dictionary Array Data MIME Type

- [x] KeyChain

- [x] WKWebView keyboard

- [x] WKWebView protocol

- [x] URL query

- [x] Log

- [x] String Size

- [x] TableView to image

- [x] UINavigationController rota

  


