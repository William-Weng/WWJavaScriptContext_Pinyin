import UIKit
import JavaScriptCore
import WWJavaScriptContext

// MARK: - WWJavaScriptContext.MarkDown
extension WWJavaScriptContext {
    
    open class Pinyin: NSObject {
        
        public static let shared = Pinyin(filename: "PinyinPro-3.19.3.js")
        
        var context: WWJavaScriptContext?
        
        private override init() {}
        
        convenience init(filename: String) {
            self.init()
            self.context = self.build(filename: filename)
        }
    }
}

// MARK: - enum
public extension WWJavaScriptContext.Pinyin {
    
    /// 輸出文字類型
    enum OutputType: String {
        case text       // 文字
        case array      // 陣列
    }
    
    /// 聲調形式
    enum ToneType: String {
        case general    // 一般型
        case none       // 沒有聲調
        case num        // 數字型
    }
}

// MARK: - 公開函數
public extension WWJavaScriptContext.Pinyin {
    
    /// [中文字 => 漢語拼音](https://unpkg.com/browse/pinyin-pro@3.19.3/dist/index.js)
    /// - Parameters:
    ///   - text: String
    ///   - outputType: 輸出文字類型 (文字 / 陣列)
    ///   - toneType: 聲調形式 (一般型 / 沒有聲調 / 數字型)
    /// - Returns: JSValue?
    func convertText(_ text: String, outputType: OutputType = .text, toneType: ToneType = .general) -> JSValue? {
        
        guard let context = context,
              let script = readScript(with: "jsSource.js")
        else {
            return nil
        }
        
        _ = context.evaluateScript(script)
        return context.callFunctionName("convertPinyin", arguments: [text, outputType.rawValue, toneType.rawValue])
    }
}

// MARK: - 小工具
private extension WWJavaScriptContext.Pinyin {
    
    /// 建立初始物件
    /// - Parameter filename: String
    /// - Returns: WWJavaScriptContext?
    func build(filename: String) -> WWJavaScriptContext? {
        
        guard let script = readScript(with: filename) else { return nil }
        return WWJavaScriptContext.build(script: script)
    }
    
    /// 讀取Script
    /// - Parameter filename: String
    /// - Returns: String?
    func readScript(with filename: String) -> String? {
        
        guard let sourcePath: String = Bundle.module.path(forResource: filename, ofType: nil),
              let script = try? String(contentsOfFile: sourcePath)
        else {
            return nil
        }
        
        return script
    }
}
