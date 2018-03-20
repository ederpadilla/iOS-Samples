//
//  PostWithImageAndTextTableViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 04/03/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import Firebase

class PostWithImageAndTextTableViewCell: UITableViewCell {

    @IBOutlet weak var mPostImage: UIImageView!
    @IBOutlet weak var mPostText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setText(post : PostObject){
        mPostText.text = post.posttext!
        setImage(imageUrl: post.postImage!)
    }
    func setImage(imageUrl : String){
        let storageRef = Storage.storage().reference(forURL: "gs://ios-samples-1516902176952.appspot.com")
        let postImageRef = storageRef.child(imageUrl)
        postImageRef.getData(maxSize: 8 * 1024 * 1024){
            data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print("😡😡😡😡 error descargando la imagen \(error.localizedDescription)")
            } else {
                // Data for "images/island.jpg" is returned
                let imageFromFb = UIImage(data: data!)
                self.mPostImage.image = imageFromFb
            }
        }
    }

}
