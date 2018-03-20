//
//  TicTacToeViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 22/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    var activePlayer = 1
    var playerOne = [Int]()
    var playerTwo = [Int]()
    
    @IBOutlet weak var buOne: UIButton!
    @IBOutlet weak var buTwo: UIButton!
    @IBOutlet weak var buThree: UIButton!
    @IBOutlet weak var buFour: UIButton!
    @IBOutlet weak var buFive: UIButton!
    @IBOutlet weak var buSix: UIButton!
    @IBOutlet weak var buSeven: UIButton!
    @IBOutlet weak var buEight: UIButton!
    @IBOutlet weak var buNine: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("👾Tic tac toe")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buSelect(_ sender: Any) {
        let buSelect = sender as! UIButton
        playGame(buSelect: buSelect)
    }
    func playGame(buSelect : UIButton){
        if activePlayer == 1{
            buSelect.setTitle("x", for: UIControlState.normal)
            buSelect.backgroundColor = UIColor(red: 102/255, green: 250/255, blue: 51/255, alpha: 0.5)
            playerOne.append(buSelect.tag)
            activePlayer = 2
            autoplay()
        }else{
            buSelect.setTitle("O", for: UIControlState.normal)
            buSelect.backgroundColor = UIColor(red: 32/255, green: 192/255, blue: 243/255, alpha: 0.5)
            playerTwo.append(buSelect.tag)
            activePlayer = 1
        }
        buSelect.isEnabled = false
        findWinner()
    }
    func findWinner(){
        var winner = -1
        //raw 1
        if(playerOne.contains(1)&&playerOne.contains(2)&&playerOne.contains(3)){
            winner = 1
        }
        if(playerTwo.contains(1)&&playerTwo.contains(2)&&playerTwo.contains(3)){
            winner = 2
        }
        //raw 2
        if(playerOne.contains(4)&&playerOne.contains(5)&&playerOne.contains(6)){
            winner = 1
        }
        if(playerTwo.contains(4)&&playerTwo.contains(5)&&playerTwo.contains(6)){
            winner = 2
        }
        //raw 3
        if(playerOne.contains(7)&&playerOne.contains(8)&&playerOne.contains(9)){
            winner = 1
        }
        if(playerTwo.contains(7)&&playerTwo.contains(8)&&playerTwo.contains(9)){
            winner = 2
        }
        //col 1
        if(playerOne.contains(1)&&playerOne.contains(4)&&playerOne.contains(7)){
            winner = 1
        }
        if(playerTwo.contains(1)&&playerTwo.contains(4)&&playerTwo.contains(7)){
            winner = 2
        }
        //col 2
        if(playerOne.contains(2)&&playerOne.contains(5)&&playerOne.contains(8)){
            winner = 1
        }
        if(playerTwo.contains(2)&&playerTwo.contains(5)&&playerTwo.contains(8)){
            winner = 2
        }
        //col 3
        if(playerOne.contains(3)&&playerOne.contains(6)&&playerOne.contains(9)){
            winner = 1
        }
        if(playerTwo.contains(3)&&playerTwo.contains(6)&&playerTwo.contains(9)){
            winner = 2
        }
        //diagonal 1
        if(playerOne.contains(1)&&playerOne.contains(5)&&playerOne.contains(9)){
            winner = 1
        }
        if(playerTwo.contains(1)&&playerTwo.contains(5)&&playerTwo.contains(9)){
            winner = 2
        }
        //diagonal 2
        if(playerOne.contains(3)&&playerOne.contains(5)&&playerOne.contains(7)){
            winner = 1
        }
        if(playerTwo.contains(3)&&playerTwo.contains(5)&&playerTwo.contains(7)){
            winner = 2
        }
        if winner != -1{
            var msg : String?
            if winner == 1{
                msg = "Player one X wins"
            }else{
                msg = "Player two O wins"
            }
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert,animated: true,completion: nil)
        }
    }
    func autoplay()  {
        var emptyCeld = [Int]()
        for index in 1...9{
            if !(playerOne.contains(index)||playerTwo.contains(index)){
                emptyCeld.append(index)
            }
        }
        let randIndex = arc4random_uniform(UInt32(emptyCeld.count))
        let cellId = emptyCeld[Int(randIndex)]
        var buSelect : UIButton?
        switch cellId {
        case 1:
            buSelect = buOne
        case 2:
            buSelect = buTwo
        case 3:
            buSelect = buThree
        case 4:
            buSelect = buFour
        case 5:
            buSelect = buFive
        case 6:
            buSelect = buSix
        case 7:
            buSelect = buSeven
        case 8:
            buSelect = buEight
        case 9:
            buSelect = buNine
        default:
            buSelect = buOne
        }
        playGame(buSelect: buSelect!)
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
