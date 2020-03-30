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
    
    @IBOutlet var firstTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        userTF.setToolBar()
        firstTF.setToolBar()
        userTF.showHidePassword()
    }

    @objc func doneBttonClicked() {
        userTF.resignFirstResponder()
    }
    
    
}




extension UITextField {
    
    var selectedTag: Int {
        get {
            return self.tag
        }
    }
    
    func setToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let previos = UIBarButtonItem(title: "Previos", style: .plain, target: nil, action: #selector(previousTextField))
        
        let next = UIBarButtonItem(title: "Next", style: .plain, target: nil, action: #selector(nextTextField))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBttonClicked))
        toolBar.setItems([previos,next,flexSpace,done], animated: true)
        self.rightViewMode = .always
        self.inputAccessoryView = toolBar
    }
   
    
    @objc func previousTextField() {
        if self.tag == selectedTag {
//            self.resignFirstResponder()
//            let tf = self.tag - 1
//                [
            
        }
    }
    
    @objc func nextTextField() {
        self.resignFirstResponder()
    }
    
    @objc func doneBttonClicked() {
        self.resignFirstResponder()
    }
    
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
