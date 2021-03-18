//
//  ViewController.swift
//  IOSChatApp
//
//  Created by 주민경 on 2021/03/02.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var box = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCenterImage()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.callLoginView()
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
    
    func callLoginView() {
        print("aaa")
        guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        else { return print("aaas") }
        
        self.present(loginVC, animated: false, completion: nil)
    }

}
