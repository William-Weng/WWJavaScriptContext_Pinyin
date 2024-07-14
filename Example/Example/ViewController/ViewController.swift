//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//  ~/Library/Caches/org.swift.swiftpm/

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
    
    /// 拼音測試
    /// - Parameter source: String
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
