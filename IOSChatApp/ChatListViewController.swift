//
//  ChatListViewController.swift
//  IOSChatApp
//
//  Created by 주민경 on 2021/03/27.
//

import UIKit
import Firebase


class ChatListViewController: UIViewController {
    
    
//    private var ChatListTableView: UITableView = .init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    @IBOutlet private var chatListTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ChatList"
    }
    
    func pushChatContentsViewController(){
        let shatContentsViewController = ChatContentsViewController(nibName: "ChatContentsViewController", bundle: nil)
        self.navigationController?.pushViewController(shatContentsViewController, animated: true)
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
