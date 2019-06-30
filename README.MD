![Release](https://img.shields.io/github/release/DingSoung/Extension.svg)
![Status](https://travis-ci.org/DingSoung/Extension.svg?branch=master)

![SwiftPackage](https://img.shields.io/badge/SwiftPackage-compatible-E66848.svg?style=flat)

![Language](https://img.shields.io/badge/Swift-5-FFAC45.svg?style=flat)
![Platform](http://img.shields.io/badge/Platform-iOS|tvOS|macOS|watchOS-E9C2BD.svg?style=flat)

[![Donate](https://img.shields.io/badge/Donate-PayPal-9EA59D.svg)](https://paypal.me/DingSongwen)

### Beief

 A collection Extension for quick developing

### Install

#### Swift Package Manager

```swift
"https://github.com/DingSoung/Extension.git", Version(0,9,0))
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
