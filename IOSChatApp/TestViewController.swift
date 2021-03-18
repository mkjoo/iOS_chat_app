//
//  TestViewController.swift
//  IOSChatApp
//
//  Created by LEED on 2021/03/18.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "TestTest"
        // Do any additional setup after loading the view.
    }


    @IBAction private func nextButtonDidTap(_ sender: UIButton) {
        self.pushTest2ViewController()
    }
    
    private func pushTest2ViewController() {
        let test2ViewController = Test2ViewController(nibName: "Test2ViewController", bundle: nil)
        self.navigationController?.pushViewController(test2ViewController, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
