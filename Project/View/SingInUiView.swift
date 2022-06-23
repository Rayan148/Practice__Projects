//
//  SingInUiView.swift
//  Project
//
//  Created by Ebpearls on 22/06/2022.
//

import UIKit

class SignInUiView: UIView {
    
    let stackView = UIStackView()

    let userNameTextField = customTextField()
    let passwordTextField = customTextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignInUiView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        clipsToBounds = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.layer.cornerRadius = 5.0
        stackView.layer.cornerCurve = .continuous
        stackView.clipsToBounds = true
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Email Address"
        userNameTextField.delegate = self
        userNameTextField.backgroundColor = .secondarySystemBackground
        userNameTextField.layer.cornerRadius = 6
        userNameTextField.textAlignment = .left
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .secondarySystemBackground
        passwordTextField.layer.cornerRadius = 6
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        
        
    }
    func addConstraints() {
        
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            userNameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),

        ])
    }
}

extension SignInUiView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if (userNameTextField.text != "") && (passwordTextField.text != "") {
            return true
        } else {
            userNameTextField.placeholder = "Enter your Email Address"
            passwordTextField.placeholder = "Enter your Password"
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {}
}

