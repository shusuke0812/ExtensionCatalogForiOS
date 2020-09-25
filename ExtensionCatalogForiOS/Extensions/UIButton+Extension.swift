//
//  UIButton+Extension.swift
//  ExtensionCatalogForiOS
//
//  Created by Shusuke Ota on 2020/8/16.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

extension UIButton {
    /// ボタンのスタイルを設定する
    /// - Parameters:
    ///   - backgroundColor: 背景色（透明 = clear）
    ///   - borderColor: 枠線
    ///   - borderWidth: 枠線幅（推奨値 = 2.0）
    ///   - cornerRadius: 角丸（推奨値 = 6.0）
    func setButtonStyle(backgroundColor: CGColor, borderColor: CGColor, borderWidth: CGFloat = 2.0, cornerRadius: CGFloat = 6.0) {
        self.layer.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
}
