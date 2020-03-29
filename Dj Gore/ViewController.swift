//
//  ViewController.swift
//  Dj Gore
//
//  Created by Apple on 28/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userTF: UITextField!
    
    let toolBar = UIToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        toolBar.sizeToFit()
        

        userTF.showHidePassword()
        
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBttonClicked))
        toolBar.setItems([done], animated: true)

        userTF.inputAccessoryView = toolBar

        // Do any additional setup after loading the view.
    }

    @objc func doneBttonClicked() {
        userTF.resignFirstResponder()
    }

}



extension UITextField {
    
    func showHidePassword() {
        let eye = UIButton(frame: CGRect(x: self.frame.width - 30, y: 0, width: 25, height: 30))
        eye.tag = 0
        eye.setBackgroundImage(UIImage(named: "closeEye"), for: .normal)
        eye.addTarget(self, action: #selector(performAction(eye:)), for: .touchUpInside)
        self.rightViewMode = .always
        self.rightView = eye
    }
    
    @objc func performAction(eye: UIButton) {
        if eye.tag == 0 {
            eye.tag = 1
            self.isSecureTextEntry = true
            eye.setBackgroundImage(UIImage(named: "openEye"), for: .normal)
        }else {
            eye.tag = 0
            self.isSecureTextEntry = false
            eye.setBackgroundImage(UIImage(named: "closeEye"), for: .normal)
        }
        
        
    }
}
