//
//  ChatTableViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 08/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var mNickName: UILabel!
    @IBOutlet weak var mMessage: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setChat(chat : ChatModel)  {
        mNickName.text = chat.nickName
        mMessage.text = chat.message
    }

}
