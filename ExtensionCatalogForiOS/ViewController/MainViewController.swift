//
//  ViewController.swift
//  ExtensionCatalogForiOS
//
//  Created by Shusuke Ota on 2020/8/16.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var testBtnView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    @IBAction func tapTestBtn(_ sender: Any) {
        self.didTestMethod()
    }
}

extension MainViewController {
    private func setUI() {
        self.testBtnView.layer.cornerRadius = 10.0
    }
    // テスト用のコードをここに書く（使い捨て）
    private func didTestMethod() {
        UIAlertController.showAlertView(vc: self, title: "テスト表示", message: "こちらの内容でよろしいでしょうか？", preferredStyle: .alert, okBtnLabel: "OK", cancelBtnLabel: "キャンセル", completion: nil)
    }
}
