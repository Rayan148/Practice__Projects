//
//  SingInViewController.swift
//  Project
//
//  Created by Ebpearls on 22/06/2022.
//


import UIKit
import FBSDKLoginKit

class SignInViewController: UIViewController {
    
    let mainVC = MainViewController()
    
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
        loginButton.configuration?.cornerStyle = .capsule
        loginButton.configuration?.baseBackgroundColor = .purple
        loginButton.clipsToBounds = true
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .primaryActionTriggered)
        loginButton.autoSetDimension(.height, toSize:  40)
        
        fbSignInButton.translatesAutoresizingMaskIntoConstraints = false
//        fbSignInButton.layer.cornerCurve = .continuous
        fbSignInButton.configuration?.cornerStyle = .capsule
        fbSignInButton.addTarget(self, action: #selector(facebookButtonPressed), for: .primaryActionTriggered)
        
    }
    private func addConstraints() {
        
        let offset: CGFloat = -30.0
        
        view.addSubview(signInCustomView)
        view.addSubview(loginButton)
        view.addSubview(fbSignInButton)
        
        NSLayoutConstraint.activate([
            signInCustomView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInCustomView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInCustomView.trailingAnchor, multiplier: 1),
            
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: signInCustomView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalTo: signInCustomView.layoutMarginsGuide.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: signInCustomView.layoutMarginsGuide.trailingAnchor),
            
//            fbSignInButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 5),
//            fbSignInButton.autoPinEdge(toSuperviewSafeArea: .top),
            fbSignInButton.leadingAnchor.constraint(equalTo: signInCustomView.layoutMarginsGuide.leadingAnchor),
            fbSignInButton.trailingAnchor.constraint(equalTo: signInCustomView.layoutMarginsGuide.trailingAnchor),
            fbSignInButton.autoPinEdge(.bottom, to: .top, of: signInCustomView, withOffset: offset),
            
        ])
    }
}

extension SignInViewController {
    
    @objc func loginButtonPressed() {
        
    }
    
    @objc func facebookButtonPressed() {
        navigationController?.pushViewController(mainVC, animated: true)
    }
}

extension SignInViewController: LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        getUserDataFromFacebook()
    }
            
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logged Out")
    }
    
}

extension SignInViewController {
    
    func getUserDataFromFacebook() {
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, id, first_name, picture, last_name"])
        request.start { connection, result, error in
            
            if let err = error { print(err.localizedDescription); return } else {
                if let fields = result as? [String:Any], let email = fields["email"] as? String, let id = fields["id"] as? String, let firstName = fields["first_name"] as? String,  let lastName = fields["last_name"] as? String {
                    let facebookProfileString = "http://graph.facebook.com/\(id)/picture?type=large"
                    
                    print(email, firstName, lastName, id, facebookProfileString)
                }
                
                print("\(String(describing: result))")
            }
        }
}
}

