//
//  NotesTableViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 01/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mLaTitle: UILabel!
    @IBOutlet weak var mLADes: UITextView!
    @IBOutlet weak var mLaDate: UILabel!
    @IBOutlet weak var mBuEdit: UIButton!
    @IBOutlet weak var mBuDelete: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setNotes(note : MyNotes){
        mLADes.text = note.details
        mLaTitle.text = note.title
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let now = dateFormat.string(from: note.date_save as! Date)
        mLaDate.text = now
    }
}
