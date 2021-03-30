//
//  ChatContentsViewController.swift
//  IOSChatApp
//
//  Created by 주민경 on 2021/03/27.
//

import UIKit

class ChatContentsViewController: UIViewController {
    
    @IBOutlet private weak var contentContainerView: UIView?
    @IBOutlet private weak var titleContainerView: UIView?
    @IBOutlet private weak var inputContainerView: UIView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var inputField: UITextField?
    
    private var contentsTableView: UITableView = .init(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
