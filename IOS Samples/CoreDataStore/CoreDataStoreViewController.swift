//
//  CoreDataStoreViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 06/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class CoreDataStoreViewController: UIViewController {

    @IBOutlet weak var mInputStoreName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func mBuSaveAction(_ sender: Any) {
        let newStore = StoreType(context: context)
        newStore.store_name = mInputStoreName.text
        do{
        try ad.saveContext()
            mInputStoreName.text = ""
        } catch{
            print("Error 😡😡😡😡 \(error)")
        }
    }
    
    @IBAction func mBuAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
