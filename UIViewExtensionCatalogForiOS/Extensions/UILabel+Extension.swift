//
//  UILabel+Extension.swift
//  UIViewExtensionCatalogForiOS
//
//  Created by Shusuke Ota on 2020/8/17.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

extension UILabel {
    /// ラベルの行間を変更する
    /// - Parameters:
    ///     - label: ラベルのテキスト
    ///     - space: 行間
    func changeLineSpacing(label: String, space: Float) -> NSMutableAttributedString {
        let lineSpacingStyle = NSMutableParagraphStyle()
        lineSpacingStyle.lineSpacing = CGFloat(space)
        let lineSpacingAttribute = [NSAttributedString.Key.paragraphStyle: lineSpacingStyle]
        return NSMutableAttributedString(string: label, attributes: lineSpacingAttribute)
    }
    /// ラベルの高さを取得する
    func getLabelFrameHeight() -> Int {
        self.sizeToFit()
        let labelFrameHeight: CGFloat = self.frame.height
        return Int(labelFrameHeight)
    }
}
