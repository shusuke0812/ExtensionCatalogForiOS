//
//  UIViewController+Extension.swift
//  ExtensionCatalogForiOS
//
//  Created by Shusuke Ota on 2021/2/18.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    /// キーボードを立ち上げた時にBaseViewをキーボードの高さ分だけ上にずらす通知をする
    func addNotificationCenterForMovingViewWithKeyboardHeight() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            } else {
                let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
                self.view.frame.origin.y -= suggestionHeight
            }
        }
    }
    @objc private func keyboardWillHide() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    /// キーボードを立ち上げた時にBaseViewをキーボードの高さ分だけ上にずらす通知を外す
    func removeNotificationCenterForMovingViewWithKeyboardHeight() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    /// キーボードを立ち上げた時にキーボード以外をタップしたらキーボードが閉じる
    func setDissmissKeyboard() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dissmissKeyboard))
        tapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc private func dissmissKeyboard() {
        self.view.endEditing(true)
    }
    /// Safariで指定したURLのページを開く
    /// - Parameter urlString: URL文字列
    internal func transitionSafariViewController(urlString: String) {
        let url: URL?
        // 不正なURLであるかを判定する（不正なものはhttpsスキームをつけてブラウザでエラーハンドリングする）
        if urlString.hasPrefix("http://") || urlString.hasPrefix("https://") {
            url = URL(string: urlString)
        } else {
            url = URL(string: "https://" + urlString)
        }
        // Safariでwebページを開く
        if let url = url {
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
        }
    }
    /// imagePickerを起動する
    internal func openImagePicker() {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.sourceType = .photoLibrary
        picker.navigationBar.barTintColor = .black
        self.present(picker, animated: true, completion: nil)
    }
}
