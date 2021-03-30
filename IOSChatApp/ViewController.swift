//
//  ViewController.swift
//  IOSChatApp
//
//  Created by 주민경 on 2021/03/02.
//

import UIKit
import SnapKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    var box = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCenterImage()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupAuthListener()
    }


}

private extension ViewController {
    
    func setCenterImage() {
        self.view.addSubview(self.box)
        self.box.frame = CGRect.init(x: self.view.frame.width/2, y: self.view.frame.height/2, width: 100, height: 100)
        self.box.snp.makeConstraints{ (make) in
            make.center.equalTo(self.view)
            make.width.height.equalTo(100)
        }

        self.box.image = #imageLiteral(resourceName: "talkIcon")
        //self.view.backgroundColor = UIColor.black
    }
    
    func setupAuthListener() {
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if let _ = user {
                self?.presentChatListViewController()
            } else {
                self?.presentLoginViewController()
            }
        }
    }
    
    func presentLoginViewController() {
        let loginViewControler = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginViewControler.modalPresentationStyle = .overFullScreen
        loginViewControler.delegate = self
        self.present(loginViewControler, animated: false, completion: nil)
    }
    
    func presentChatListViewController() {
        let chatListViewController = ChatListViewController(nibName: "ChatListViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: chatListViewController)
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: true, completion: nil)
//        guard let chatListView = self.storyboard?.instantiateViewController(withIdentifier: "ChatListViewController") as? ChatViewController else { return }
//        self.present(chatListView, animated: true, completion: nil)
    }

}


extension ViewController: LoginViewControllerDelegate {
    
    func loginViewController(_ viewController: LoginViewController, didSuccessLoginWith authDataResult: AuthDataResult) {
        viewController.dismiss(animated: true) { [weak self] in
            self?.presentChatListViewController()
        }
    }
}
