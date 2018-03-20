//
//  RestaurantViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 26/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var foodList = [Food]()
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoodsFromPropertyList()
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : FoodCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellFood", for: indexPath) as! FoodCollectionViewCell
        cell.setFoof(food: foodList[indexPath.row])
        return cell
    }
    
    func loadFoodsFromPropertyList(){
        let path = Bundle.main.path(forResource: "Foods", ofType: "plist")! as String
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf : url)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            let dicArray = plist as! [[String:String]]
            for food in dicArray{
                print("🍔Oh sorpresa el nombre es \(food["Name"]!)")
                foodList.append(Food(name: food["Name"]!, des: food["Des"]!, image: food["Image"]!))
            }
        }catch{
            print("Can not read file ☠️")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: foodList[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails"{
        if let dis = segue.destination as? FoodProductViewController{
            if let food = sender as? Food{
                dis.food = food
                }
            }
        }
    }
}
