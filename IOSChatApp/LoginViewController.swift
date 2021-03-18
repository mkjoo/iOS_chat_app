//
//  LoginViewController.swift
//  IOSChatApp
//
//  Created by 주민경 on 2021/03/02.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

protocol LoginViewControllerDelegate: class {
    func loginViewController(_ viewController: LoginViewController, didSuccessLoginWith authDataResult: AuthDataResult)
}

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?

    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    @IBOutlet weak var loginButton: UIButton?
    @IBOutlet weak var signUpButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //GIDSignIn.sharedInstance().presentingViewController = self
        self.setLoginButton()
        self.setupDummyData()
        // Do any additional setup after loading the view.
    }

}

private extension LoginViewController {
    
    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    func setLoginButton() {
        self.loginButton?.addTarget(self, action: #selector(self.loginEvent(sender:)), for: .touchUpInside)
    }
    
    func setupDummyData() {
        self.emailTextField?.text = "test@gmail.com"
        self.passwordTextField?.text = "test1234"
    }
}

private extension LoginViewController {
    
    func presentErrorAlert(with error: Error) {
        let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func loginEvent(sender: UIButton) {
        
        guard let email = self.emailTextField?.text,
              let password = self.passwordTextField?.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, err) in
            print("\(#function) - 1")
            if let error = err {
                print("\(#function) - 2")
                self.presentErrorAlert(with: error)
            } else if let authDataResult = authDataResult {
                print("\(#function) - 3")
                self.delegate?.loginViewController(self, didSuccessLoginWith: authDataResult)
            }
        }
    }
}
