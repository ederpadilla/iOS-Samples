//
//  PostsTableViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 13/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import Firebase
class PostsTableViewCell: UITableViewCell ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var ref = DatabaseReference.init()
    @IBOutlet weak var mTxtPost: UITextView!
    var userUid :  String?
    var imagePath : String = "no image"
    var imagePicker : UIImagePickerController!
    var main : TwitterViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func mBuAttach(_ sender: Any) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        main!.present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func mBuPost(_ sender: Any) {
        ref = Database.database().reference()
        let postsMsg = ["userUid" : userUid, "text": mTxtPost.text!,"imagePath":imagePath,
                        "postDate ": ServerValue.timestamp()] as [String : Any]
        ref.child("Posts").childByAutoId().setValue(postsMsg)
        imagePath = "no image"
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            uploadImage(mImageIcon: image)
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    func uploadImage(mImageIcon : UIImage){
        let storeRef = Storage.storage().reference(forURL: "gs://ios-samples-1516902176952.appspot.com")
        var data = NSData()
        data = UIImageJPEGRepresentation(mImageIcon, 0.8)! as NSData
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = "MM_DD_yy_h_mm_a"
        let imageName = "\(self.userUid!)_ \(dataFormat.string(from : NSDate() as Date))"
        self.imagePath = "user_posts/\(imageName).jpg"
        let childUserImages = storeRef.child(self.imagePath)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        //upload image
        childUserImages.putData(data as Data, metadata: metaData)
    }
}
