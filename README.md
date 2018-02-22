**NotificationBar** is a simple module that allows you to show notifications or alerts. It's simple to use yet very customizable. Just make an instance and call a method to show, that's it!

![iOS 8+](https://img.shields.io/badge/iOS-8%2B-blue.svg?style=flat)
![Swift 4](https://img.shields.io/badge/Swift-4-orange.svg?style=flat)

## Default Look

<image src="https://media.giphy.com/media/9PgwWOfOHReECsYz29/giphy.gif" width="400"/>

## Installation
Right now you can drag and drop files from the `Source` folder. I will release it on CocoaPods soon.

### Manual

## Usage

Make an instance of `NotificationBar` with desired properties in the initializer and `show()` method. Don't forget to call the `dismiss()` method if you passed `.loading` for style in the init.

### Customizations

#### NotificationBarConfiguration

You can set the following properties on `NotificationBar.sharedConfig` which will then be applied on all NotificationBar instances thereafter:

- `duration`: Duration after which auto dismissed notification bar is dismissed
- `font`: The default font of the text
- `textColor`: The color of the text
- `padding`: Padding around the text
- `loadingColor`: Default background color for `.loading` style
- `successColor`: Default background color for `.sucess` style
- `errorColor`: Default color for `.error` style

#### Custom NotificationBarStyle

You can provide a custom style in the initializer by providing an instance of `NotificationBarStyle.VisualConfig` using `NotificationBarStyle.custom`.

```swift
let customConfig = NotificationBarStyle.VisualConfig(backgroundColor: .gray,
                                                     isLoaderHidden: true,
                                                     dismiss: .auto)
NotificationBar(over: self, text: "Some text", style: .custom(customConfig))
```

#### NotificationBarDismiss

It's important to remember that if the dismiss property of the NotificationBar is set to `.manual`, the user must also call `dismiss()` on the NotificationBar. Style `.loading` has a dismiss property of `.manual`.

## TODO

- [ ] Add Cocoapods support
- [ ] Add Carthage support
- [ ] Add Swift Package Manager support

## Mentions

- [Maroof Khan](https://github.com/maroofkhan)

## Project Details

### Requirements
* Swift 4.0
* Xcode 7.0+
* iOS 8.0+

### Contributing
Feel free to collaborate with ideas 💭, issues ⁉️ and/or pull requests 🔃.

If you use NotificationBar in your app I'd love to hear about it and feature your animation here!

### Author

Furqan Khan | [@furqanmk9](https://twitter.com/furqanmk9)


[![Twitter Follow](https://img.shields.io/twitter/follow/furqanmk9.svg?style=social)](https://twitter.com/furqanmk9)

### License

 Copyright (c) 2016 Furqan Muhammad Khan <furqanmk9>

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
