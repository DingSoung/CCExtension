### Brief
A extension to force Localization to specific language

### Feature
* no need to restart app
* support custom bundle
* support NSLocalizedString
* support xibs
* support to reset
* use extension, no need to subclass
* light weight (only on file), easy to use(ref usage)


### Usage
```
NSObject.languageCode = @"en";
[NSBundle mainBundle].localizationCode = @"en";
custonBundle.localizationCode = @"en";
/// reload your UI, ex: reload root viewcontroller
```
