//
//  ChatViewController.swift
//  IOSChatApp
//
//  Created by 주민경 on 2021/03/09.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet private weak var contentContainerView: UIView?
    @IBOutlet private weak var titleContainerView: UIView?
    @IBOutlet private weak var inputContainerView: UIView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var inputField: UITextField?
    
    
    private var contentsTableView: UITableView = .init(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupContentsTableView()
        // Do any additional setup after loading the view.
    }


}

private extension ChatViewController {
    
    func setupContentsTableView() {
        self.contentsTableView.addSubview(self.contentsTableView)
        
    }
}
