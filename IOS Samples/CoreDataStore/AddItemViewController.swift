//
//  AddItemViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 06/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit
import CoreData

class AddItemViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,
    UINavigationControllerDelegate{

//    @IBOutlet weak var mStorePickerView: UIPickerView!
//    @IBOutlet weak var mInputItemName: UITextField!
    @IBOutlet weak var mStorePickerView: UIPickerView!
    
    @IBOutlet weak var mInputItemName: UITextField!
    
    @IBOutlet weak var mImageView: UIImageView!
    
    var storesList = [StoreType]()
    
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStores()
        mStorePickerView.dataSource = self
        mStorePickerView.delegate = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
//
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return storesList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            let storeName = storesList[row]
            return storeName.store_name
    }

    @IBAction func mBuAction(_ sender: Any) {
        let newItem = Items(context:context)
        newItem.item_name = mInputItemName.text
        newItem.date_add = NSDate() as? Date
        newItem.image = mImageView.image
        newItem.toStoreType = storesList[mStorePickerView.selectedRow(inComponent: 0)]
        do {
            try ad.saveContext()
            mInputItemName.text = ""
        }catch{
            print("💩💩💩💩💩Cannot save item \(error)")
        }
    }
    @IBAction func mBuSelectImage(_ sender: Any) {
       present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            mImageView.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mBuBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mBuAddStores(_ sender: Any) {
        performSegue(withIdentifier: "showAddStore", sender: nil)
    }
    func loadStores(){
        let fetchRequest : NSFetchRequest<StoreType> = StoreType.fetchRequest()
        do{
            storesList = try context.fetch(fetchRequest)
        }catch{
            print("Cannot read stores 😡😡😡😡😡 \(error)")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        loadStores()
        mStorePickerView.reloadAllComponents()
        
    }
    
}
