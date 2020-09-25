//
//  UIImageView+Extension.swift
//  ExtensionCatalogForiOS
//
//  Created by Shusuke Ota on 2020/8/17.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

extension UIImageView {
    /// アイコンなどの画像色を変更する
    /// - Parameters:
    ///   - imageName: 画像の名前
    ///   - tintColor: 画像の塗りつぶしの色
    func changeImageColor(imageName: String, tintColor: UIColor) {
        self.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        self.tintColor = tintColor
    }
}
