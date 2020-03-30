//
//  PasswordTextField.swift
//  Dj Gore
//
//  Created by CodeCat15 on 3/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

struct PasswordRightViewImage {
    static let closedEyes = "closeEye"
    static let openEyes = "openEye"
}

//https://developer.apple.com/documentation/uikit/uitextfield/1619596-rightview
class PasswordTextField: UITextField {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code

        let passwordImageButton = UIButton(type: .custom)
        passwordImageButton.setImage(UIImage(named: PasswordRightViewImage.closedEyes), for: .normal)
        passwordImageButton.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
        passwordImageButton.addTarget(self, action: #selector(onEyeTapEvent(_sender:)), for: .touchUpInside)

        let buttonContainerView: UIView = UIView(frame:CGRect(x: 20, y: 0, width: 30, height: 30))
        buttonContainerView.addSubview(passwordImageButton)

        self.rightView = buttonContainerView
        self.rightViewMode = .always
    }

    @objc private func onEyeTapEvent(_sender: UIButton)
    {
        if (_sender.tag == 0) // user wants to see what password they entered
        {
            _sender.tag = 1
            self.isSecureTextEntry = false
            _sender.setImage(UIImage(named: PasswordRightViewImage.openEyes), for: .normal)
        }
        else if(_sender.tag == 1) // user wants to hide the password they entered
        {
            _sender.tag = 0
            self.isSecureTextEntry = true
            _sender.setImage(UIImage(named: PasswordRightViewImage.closedEyes), for: .normal)
        }
    }
}
