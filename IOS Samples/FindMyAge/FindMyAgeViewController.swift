//
//  FindMyAgeViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 16/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class FindMyAgeViewController: UIViewController , UITextFieldDelegate{

    
    @IBOutlet weak var mLabelShowText: UILabel!
    @IBOutlet weak var mTxtYearOfBirth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Aqui se empieza la app")
        mTxtYearOfBirth.placeholder = "Hola mundo"
        // Do any additional setup after loading the view.
    }

    @IBAction func mButtonFindAge(_ sender: Any) {
        print("Le dio click al boton")
        getAge()
      
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //fire when someone click on retunr keyborad
        self.view.endEditing(true)
        getAge()
        return true
    }
    func getAge(){
        if !mTxtYearOfBirth.text!.isEmpty {
            let yearOfBirth = Int(mTxtYearOfBirth.text!)
            
            //get hour of phone
            let date = Date()
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            let personAge = (year-yearOfBirth!)
            mLabelShowText.text = "Tu edad es \(personAge)"
        }else{
            print("El texto esta vacio introduce algo")
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
