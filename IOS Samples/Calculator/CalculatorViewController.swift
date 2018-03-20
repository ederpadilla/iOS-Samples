//
//  CalculatorViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 17/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var mTxtNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("😡Este seria para un error")
        print("🐛Este seria para un bug")
        print("🤖Este seria para cualquier madre")
        //print("Este seria para un error")
        //print("Este seria para un bug")
        //print("Este seria para cualquier madre")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var newOperation=true
    func AddNumberToInput(number:String){
        print("number \(number)")
        print("Lo que hay adentro \(mTxtNumber)")
        var textNumber:String? = String( mTxtNumber.text!)
        if newOperation  {
            textNumber = ""
            newOperation = false
        }
        textNumber = textNumber! + number
        mTxtNumber.text = textNumber!
    }
    
    @IBAction func buo(_ sender: Any) {
        AddNumberToInput (number: "0")
    }
    
    @IBAction func buDot(_ sender: Any) {
        AddNumberToInput (number: ".")
    }
    @IBAction func bu1(_ sender: Any) {
        AddNumberToInput (number: "1")
    }
    @IBAction func bu2(_ sender: Any) {
        AddNumberToInput (number: "2")
    }
    @IBAction func bu3(_ sender: Any) {
        AddNumberToInput (number: "3")
    }
    @IBAction func bu4(_ sender: Any) {
        AddNumberToInput (number: "4")
    }
    @IBAction func bu5(_ sender: Any) {
        AddNumberToInput (number: "5")
    }
    @IBAction func bu6(_ sender: Any) {
        AddNumberToInput (number: "6")
    }
    @IBAction func bu7(_ sender: Any) {
        AddNumberToInput (number: "7")
    }
    @IBAction func bu8(_ sender: Any) {
        AddNumberToInput (number: "8")
    }
    @IBAction func bu9(_ sender: Any) {
        AddNumberToInput (number: "9")
    }
    
    var op = "+"
    var number1:Double?
    @IBAction func buMul(_ sender: Any) {
        op = "*"
        number1 = Double( mTxtNumber.text!)
        newOperation = true
    }
    
    @IBAction func buDiv(_ sender: Any) {
        op = "/"
        number1 = Double( mTxtNumber.text!)
        newOperation = true
    }
    
    
    @IBAction func buSub(_ sender: Any) {
        op = "-"
        number1 = Double( mTxtNumber.text!)
        newOperation = true
    }
    
    @IBAction func buAdd(_ sender: Any) {
        op = "+"
        number1 = Double( mTxtNumber.text!)
        newOperation = true
    }
    
    @IBAction func buAc(_ sender: Any) {
        
        mTxtNumber.text = "0"
        newOperation = true
    }
    
    @IBAction func buMinues(_ sender: Any) {
        
        var textNumber = String( mTxtNumber.text!)
        textNumber = "-" + textNumber
        mTxtNumber.text = textNumber
    }
    
    
    @IBAction func buPercent(_ sender: Any) {
        
        var number1 = Double( mTxtNumber.text!)
        
        number1 = number1!/100.0
        mTxtNumber.text = String(number1!)
        newOperation = true
    }
    
    
    
    @IBAction func buEqual(_ sender: Any) {
        let number2 = Double( mTxtNumber.text!)
        var results:Double?
        switch op {
        case "*":
            results = number1! * number2!
        case "/":
            results = number1! / number2!
        case "-":
            results = number1! - number2!
        case "+":
            results = number1! + number2!
        default:
            results = 0.0
        }
        mTxtNumber.text = String( results!)
        newOperation = true
    }
}
