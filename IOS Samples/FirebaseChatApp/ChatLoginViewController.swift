//
//  ChatLoginViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 08/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class ChatLoginViewController: UIViewController {

    @IBOutlet weak var mNickNameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mBuLogIn(_ sender: Any) {
        performSegue(withIdentifier: "chatRoom", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chatRoom"{
            if let dis = segue.destination as? FireBaseChatAppViewController{
                dis.userName = mNickNameInput.text
            }
        }
    }

}
