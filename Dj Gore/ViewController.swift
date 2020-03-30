//
//  ViewController.swift
//  Dj Gore
//
//  Created by Apple on 28/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTF: PasswordTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func doneBttonClicked() {
        userTF.resignFirstResponder()
    }
}
