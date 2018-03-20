//
//  LogInTwitterViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 09/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import Firebase
class LogInTwitterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var mImageIcon: UIImageView!
    @IBOutlet weak var mNameInput: UITextField!
    @IBOutlet weak var mMailInput: UITextField!
    @IBOutlet weak var mPassInput: UITextField!
    var imagePicker : UIImagePickerController!
    var userUid : String?
    var dataRef = DatabaseReference.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        mMailInput.text="eder@uble.mx"
        mPassInput.text="12345678"
        self.dataRef = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func mBuSelectImage(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            
            mImageIcon.image = image
        
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    func uploadImage(){
        let image : UIImage = mImageIcon.image!
        let storeRef = Storage.storage().reference(forURL: "gs://ios-samples-1516902176952.appspot.com")
        var data = NSData()
        data = UIImageJPEGRepresentation(image, 0.8)! as NSData
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = "MM_DD_yy_h_mm_a"
        let imageName = "\(self.userUid!)_ \(dataFormat.string(from : NSDate() as Date))"
        let imagePath = "user_images/\(imageName).jpg"
        let childUserImages = storeRef.child(imagePath)
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        //upload image
        childUserImages.putData(data as Data, metadata: metaData)
        //save to database
        saveUserInfo(imagePath: imagePath, userName: mNameInput.text!)
    }
    
    @IBAction func mBuLogIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: mMailInput.text!, password: mPassInput.text!){
            (user,error) in
            if let error = error{
                print("Error \(error) 😡😡😡😡😡")
            }else{
                self.userUid = user!.uid
                self.goToPosting()
            }
        }
    }
    
    @IBAction func mBuRegister(_ sender: Any) {
        Auth.auth().createUser(withEmail: mMailInput.text!, password: mPassInput.text!){
            (user,error) in
            //func
            if let error = error{
                print("Error \(error) 😡😡😡😡😡")
            }else{
                self.userUid = user!.uid
                //upload image
                self.uploadImage()
                self.goToPosting()
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func saveUserInfo(imagePath : String,userName : String){
        let msg = ["fullName":userName,"imagePath":imagePath]
        self.dataRef.child("Twitter_Users").child(self.userUid!).setValue(msg)
    }
    func goToPosting(){
        performSegue(withIdentifier: "showPosts", sender: self.userUid)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPosts" {
            if let vcPosting = segue.destination  as? TwitterViewController {
                if let userUi = sender as? String {
                    vcPosting.userUid = self.userUid
                }
            }
        }
    }
}
