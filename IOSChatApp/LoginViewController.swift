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

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //GIDSignIn.sharedInstance().presentingViewController = self
        self.setLoginView()
        // Do any additional setup after loading the view.
    }

}

private extension LoginViewController {
    
    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    func setLoginView() {
        
        self.loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                guard let chatListView = self.storyboard?.instantiateViewController(withIdentifier: "ChatListViewController") as? ChatViewController else {return}
                self.present(chatListView, animated: true, completion: nil)
            }
        }
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
      withError error: NSError!) {
        if (error == nil) {
          // Perform any operations on signed in user here.
          // ...
        } else {
          print("\(error.localizedDescription)")
        }
    }
}

private extension LoginViewController {
    @objc func loginEvent() {
        
        guard let email = self.emailTextField.text,
              let password = self.passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, err) in
            
            if err != nil {
                let alert = UIAlertController(title: "ERROR", message: err.debugDescription, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                if user != nil {
                    guard let chatListView = self.storyboard?.instantiateViewController(withIdentifier: "ChatListViewController") as? ChatViewController else { return }
                    self.present(chatListView, animated: true, completion: nil)
                }
            }
                
        }
    }
}
