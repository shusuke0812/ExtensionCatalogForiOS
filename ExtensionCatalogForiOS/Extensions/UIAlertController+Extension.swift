//
//  UIAlertController+Extension.swift
//  ExtensionCatalogForiOS
//
//  Created by Shusuke Ota on 2020/9/25.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

extension UIAlertController {
    /// スタイルを指定してアラートを表示
    internal func showAlertView(title: String, message: String, preferredStyle: UIAlertController.Style, okBtnLabel: String, cancelBtnLabel: String, completion: (() -> Void)?) {
        // ボタンスタイルを設定
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        // OKボタン押下時の処理
        let okAction: UIAlertAction = UIAlertAction(title: okBtnLabel, style: .default, handler: { (action: UIAlertAction) -> Void in
            if let completion = completion {
                completion()
            }
        })
        // キャンセルボタン押下時の処理
        let cancelAction: UIAlertAction = UIAlertAction(title: cancelBtnLabel, style: .cancel, handler: { (action: UIAlertAction) -> Void in
            if let completion = completion {
                completion()
            }
        })
        // ActionにOKボタンとキャンセルボタンを追加
        alert.addAction(okAction)
        alert.addAction(cancelAction)
    }
}
