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
    }
}

extension MainViewController {
    private func setUI() {
        self.testBtnView.layer.cornerRadius = 10.0
    }
}
