//
//  ChatListTableViewCell.swift
//  IOSChatApp
//
//  Created by 주민경 on 2021/03/27.
//

import UIKit

protocol ChatListTableViewCellDelegate: class {
    func chatListTableViewCell(_ tableViewCell: ChatListTableViewCell, didSelect button: UIButton)
}

class ChatListTableViewCell: UITableViewCell {
    
    weak var delegate: ChatListTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupChatList()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

private extension ChatListTableViewCell {
    func setupChatList(){
        
    }
}
