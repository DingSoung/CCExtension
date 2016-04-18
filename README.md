### Detail
included content:
* [CCExtension](https://github.com/DingSoung/CCExtension.git)
* [CCNetWork](https://github.com/DingSoung/CCNetwork.git)
* [CCPDFImage](https://github.com/DingSoung/CCPDFImage.git)


### Usage
way 1: download and add CCKit flore to your project, add <projectName>-Swift.h

way 2: use cocoaPod
```
# Podfile
platform :ios, '8.0'
use_frameworks!

target 'V2EX' do
    pod 'CCKit'
end
```
```
// Swift
import CCKit
```
```
// Objective-C
#import <CCKit/CCKit-Swift.h>
```
