//
//  PostWithOutImageTableViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 13/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class PostWithOutImageTableViewCell: UITableViewCell {

    @IBOutlet weak var mPostText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setText(postText : String){
        mPostText.text = postText
    }

}
