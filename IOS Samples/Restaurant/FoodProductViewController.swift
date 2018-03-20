//
//  FoodProductViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 26/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class FoodProductViewController: UIViewController {


    @IBOutlet weak var desFood: UITextView!
    @IBOutlet weak var imageFod: UIImageView!
    @IBOutlet weak var nameFood: UILabel!
    var food : Food?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameFood.text = food?.name!
        desFood.text = food?.des!
        imageFod.image = UIImage(named : (food?.image!)!)
    }
    
    @IBAction func buBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("🌮Dio back")
        dismiss(animated: true, completion: nil)
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
