//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//  ~/Library/Caches/org.swift.swiftpm/

import UIKit
import WWPrint
import WWJavaScriptContext
import WWJavaScriptContext_Pinyin

final class ViewController: UIViewController {

    private let text = "漢語拼音測試" // hàn yǔ pīn yīn cè shì
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinyinTest(source: text)
    }
}

// MARK: - 小工具
private extension ViewController {
    
    /// 拼音測試
    /// - Parameter source: String
    func pinyinTest(source: String) {
        
        guard let value = WWJavaScriptContext.Pinyin.shared.convertHTML(source: text, outputType: .text, toneType: .general),
              let pinyinText = value.toString()
        else {
            return
        }
        
        wwPrint("\(text) => \(pinyinText)")
    }
}
