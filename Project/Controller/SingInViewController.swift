//
//  SingInViewController.swift
//  Project
//
//  Created by Ebpearls on 22/06/2022.
//


import UIKit
import FBSDKLoginKit

class SignInViewController: UIViewController {
    
    let signInCustomView = SignInUiView()
    let loginButton = UIButton()
    let fbSignInButton = FBLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Observe access token changes
        // This will trigger after successfully login / logout
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            // Print out access token
            print("FB Access Token: \(String(describing: AccessToken.current?.tokenString))")
        }
        
        if let token = AccessToken.current, //Checking the current login status of an user 
                !token.isExpired {
                // User is logged in, do work such as go to next view controller.
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
            request.start { connection, result, error in
                print("\(String(describing: result))")
            }
        } else {
            fbSignInButton.permissions = ["public_profile", "email"]
            fbSignInButton.delegate = self
        }
        
        style()
        addConstraints()
    }
}

extension SignInViewController {
    
    private func style() {
        
        signInCustomView.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .primaryActionTriggered)
    }
    private func addConstraints() {
        
        view.addSubview(signInCustomView)
//        view.addSubview(fbSignInButton)
        
        NSLayoutConstraint.activate([
            signInCustomView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInCustomView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInCustomView.trailingAnchor, multiplier: 1),
            
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: signInCustomView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalTo: signInCustomView.layoutMarginsGuide.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: signInCustomView.layoutMarginsGuide.trailingAnchor),
            
            fbSignInButton.topAnchor.constraint(equalToSystemSpacingBelow: signInCustomView.bottomAnchor, multiplier: 2)
            
        ])
    }
}

extension SignInViewController {
    
    @objc func loginButtonPressed() {
        
    }
}

extension SignInViewController: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
        request.start { connection, result, error in
            print("\(String(describing: result))")
        }
    }
            
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logged Out")
    }
    
}
