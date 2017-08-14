![Release](https://img.shields.io/github/release/DingSoung/Extension.svg)
![Status](https://travis-ci.org/DingSoung/Extension.svg?branch=master)
![CocoaPods](https://img.shields.io/cocoapods/v/Extension.svg)
![Carthage](https://img.shields.io/badge/Carthage-compatible-yellow.svg?style=flat)
![Language](https://img.shields.io/badge/Swift-3.1-FFAC45.svg?style=flat)
![Platform](http://img.shields.io/badge/Platform-iOS-E9C2BD.svg?style=flat)
[![Donate](https://img.shields.io/badge/Donate-PayPal-9EA59D.svg)](https://paypal.me/DingSongwen)
### Beief

 A collection Extension for quick developing

### Install
add code below to your Cartfile and command `carthage update`
```
github "DingSoung/Extension"
```

### Localization

- no need to restart app
- support custom bundle
- support NSLocalizedString
- support xibs
- support to reset
- use extension, no need to subclass
- light weight (only on file), easy to use(ref usage)



```
NSObject.languageCode = @"en";
[NSBundle mainBundle].localizationCode = @"en";
custonBundle.localizationCode = @"en";
/// reload your UI, ex: reload root viewcontroller
```
