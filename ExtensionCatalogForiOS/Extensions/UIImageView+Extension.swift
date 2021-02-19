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
    /// 文字列型URLをUIImageに変換するメソッド
    /// - Parameters:
    ///   - imageUrlString: 画像URL
    internal func getImage(imageUrlString: String) {
        guard let url = URL(string: imageUrlString) else {
            print("画像URLの変換に失敗しました")
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("画像の読み込みに失敗しました" + "DEBUG: error=\(error)")
                return
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        .resume()
    }
}
