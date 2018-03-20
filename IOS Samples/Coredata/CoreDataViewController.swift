//
//  CoreDataViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 30/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class CoreDataViewController: UIViewController {
    
    @IBOutlet weak var mTxtTitle: UITextField!
    @IBOutlet weak var mTxtDes: UITextView!
    var editNote : MyNotes?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = editNote {
            setEditMode(note : note)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setEditMode(note : MyNotes?){
        mTxtDes.text = note?.details
        mTxtTitle.text = note?.title
    }

    @IBAction func mBtnSave(_ sender: Any) {
        var newNote : MyNotes?
        if let note = editNote{
            newNote = note
        }else {
            newNote = MyNotes(context: context)
        }
        newNote!.title = mTxtTitle.text
        newNote!.details = mTxtDes.text
        newNote!.date_save = NSDate() as Date
        do{
            ad.saveContext()
            mTxtTitle.text = ""
            mTxtDes.text = ""
        } catch{
            print("Error 💩💩💩💩💩💩💩💩\(error)")
        }
     
    }

  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
