![Release](https://img.shields.io/github/release/DingSoung/Extension.svg)
![Status](https://travis-ci.org/DingSoung/Extension.svg?branch=master)
![CocoaPods](https://img.shields.io/cocoapods/v/Extension.svg)

![Carthage](https://img.shields.io/badge/Carthage-compatible-5CC9F5.svg?style=flat)
![SwiftPackage](https://img.shields.io/badge/SwiftPackage-compatible-E66848.svg?style=flat)
![Language](https://img.shields.io/badge/Swift-4-FFAC45.svg?style=flat)

![Platform](http://img.shields.io/badge/Platform-iOS|tvOS|macOS|watchOS-E9C2BD.svg?style=flat)
[![Donate](https://img.shields.io/badge/Donate-PayPal-9EA59D.svg)](https://paypal.me/DingSongwen)

### Beief

 A collection Extension for quick developing

### Install
### Cocoa Pod

add pod file below and command `pod update`

```shell
platform :ios, ‘8.0’
use_frameworks!
target 'AppStore' do
	pod	'Extension'
end
```

#### Carthage

add code below to your Cartfile and command `carthage update`

```shell
github "DingSoung/Extension"
```

#### Swift Package Manager

follow the [SPMExample](https://github.com/DingSoung/SPMExample), UIKit excluded

```swift
import PackageDescription
let package = Package(
    name: "SPMExample",
    dependencies: [
        .Package(url: "https://github.com/DingSoung/Extension.git", Version(0,6,0)),
    ]
)
```

### Localization

- no need to restart app
- support custom bundle
- support NSLocalizedString
- support xibs
- support to reset
- use extension, no need to subclass
- light weight (only on file), easy to use(ref usage)



```objective-c
NSLocale.languageCode = @"en";
[NSBundle mainBundle].localizationCode = @"en";
custonBundle.localizationCode = @"en";
anotherCustonBundle.localizationCode = @"en";
/// reload your UI, ex: reload root viewcontroller
```
