//
//  ViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 16/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var mCollectionView: UICollectionView!
    var mainCellsList = [MainCellObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        mainCellsList.append(MainCellObject(name: "Age", image: "age"))
        mainCellsList.append(MainCellObject(name: "Calculator", image: "calculator"))
        mainCellsList.append(MainCellObject(name: "Chat", image: "chat"))
        mainCellsList.append(MainCellObject(name: "Core Data", image: "coredata"))
        mainCellsList.append(MainCellObject(name: "Machine Learning", image: "machinelearning"))
        mainCellsList.append(MainCellObject(name: "Menu", image: "menu"))
        mainCellsList.append(MainCellObject(name: "Pokemon", image: "pokemon"))
        mainCellsList.append(MainCellObject(name: "Store", image: "store"))
        mainCellsList.append(MainCellObject(name: "Sunrise", image: "sunrise"))
        mainCellsList.append(MainCellObject(name: "Tic Tac Toe", image: "tictactoe"))
        mainCellsList.append(MainCellObject(name: "Twitter", image: "twitter"))
        mainCellsList.append(MainCellObject(name: "Zoo", image: "zoo"))
        mCollectionView.delegate = self
        mCollectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func assignbackground(){
        let background = UIImage(named: "dragon_ball")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mBuShowStore(_ sender: Any) {
        performSegue(withIdentifier: "showStore", sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mainCellsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellMain = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCellId", for: indexPath as IndexPath) as! MainCollectionViewCell
        cellMain.setCellProperties(mainCell: mainCellsList[indexPath.row])
        return cellMain
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("😇😇😇😇😇Select \([indexPath.row])")
        performSegues(pos: indexPath.row)
        
    }
    func performSegues(pos : Int)  {
        switch pos {
        case 0: performSegue(withIdentifier: "getAge", sender: nil)
        case 1: performSegue(withIdentifier: "calculator", sender: nil)
        case 2: performSegue(withIdentifier: "chatApp", sender: nil)
        case 3: performSegue(withIdentifier: "coreData", sender: nil)
        case 4: performSegue(withIdentifier: "machinelearning", sender: nil)
        case 5: performSegue(withIdentifier: "menu", sender: nil)
        case 6: performSegue(withIdentifier: "pokemon", sender: nil)
        case 7: performSegue(withIdentifier: "showStore", sender: nil)
        case 8: performSegue(withIdentifier: "sunrise", sender: nil)
        case 9: performSegue(withIdentifier: "tictactoe", sender: nil)
        case 10: performSegue(withIdentifier: "twitter", sender: nil)
        case 11: performSegue(withIdentifier: "zoo", sender: nil)
        default:
            0
        }
    }
    
}

