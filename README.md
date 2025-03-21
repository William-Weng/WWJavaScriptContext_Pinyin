# WWJavaScriptContext+Pinyin
[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-15.0](https://img.shields.io/badge/iOS-15.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWJavaScriptContext_Pinyin) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

## [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Convert Chinese characters to Hanyu Pinyin.](https://unpkg.com/browse/pinyin-pro@3.19.3/dist/index.js)
- [將中文字轉換成漢語拼音。](https://github.com/zh-lx/pinyin-pro)

![](./Example.png)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```js
dependencies: [
    .package(url: "https://github.com/William-Weng/WWJavaScriptContext_Pinyin.git", .upToNextMajor(from: "1.1.0"))
]
```

### Function - 可用函式
|函式|功能|
|-|-|
|convert(text:outputType:toneType:)|中文字 => 漢語拼音|

### Example
```swift
import UIKit
import WWJavaScriptContext
import WWJavaScriptContext_Pinyin

final class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var pinyinLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        pinyinTest(text: textLabel.text)
    }
}

// MARK: - 小工具
private extension ViewController {
    
    func pinyinTest(text: String?) {
        
        guard let text = text,
              let value = WWJavaScriptContext.Pinyin.shared.convert(text: text, outputType: .text, toneType: .general),
              let pinyinText = value.toString()
        else {
            return
        }
        
        pinyinLabel.text = pinyinText
    }
}
```
