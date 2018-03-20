//
//  ZooAppViewController.swift
//  IOS Samples
//
//  Created by Eder Padilla on 22/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class ZooAppViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    //var animalList = [AnimalObject]()
    var animalType = ["Not killer","Killer"]
    var animalKillerList = [AnimalObject]()
    var animalNotKillerList = [AnimalObject]()
    @IBOutlet weak var animalTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animalNotKillerList.append(AnimalObject(name: "baboon", des: "Babbon jojojoojoj", image: "baboon"))
        
        animalNotKillerList.append(AnimalObject(name: "bulldog", des: "Bulldog bulll", image: "bulldog"))
        
        animalKillerList.append(AnimalObject(name: "panda", des: "Panda panda jojojoojoj", image: "panda"))
        
        animalNotKillerList.append(AnimalObject(name: "Swallow bird", des: "Birdddd jojojoojoj", image: "swallow_bird"))
        
        animalNotKillerList.append(AnimalObject(name: "zebra", des: "Babbon jojojoojoj", image: "zebra"))
         animalKillerList.append(AnimalObject(name: "White tiger", des: "Tiger jijijijijjij jojojoojoj", image: "white_tiger"))
        animalTableView.delegate = self
        animalTableView.dataSource = self
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalType[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return animalNotKillerList.count
        }else{
            return animalKillerList.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAnimal : ZooTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellAnimal", for: indexPath) as! ZooTableViewCell
        if indexPath.section == 0 {
            cellAnimal.setAnimalProperties(animal: animalNotKillerList[indexPath.row])
        }else{
            cellAnimal.setAnimalProperties(animal: animalKillerList[indexPath.row])
        }
        return cellAnimal
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("💩💩💩💩Select \(animalNotKillerList[indexPath.row].name!)")
            //remove
            //animalNotKillerList.remove(at: indexPath.row)
            //add
            animalNotKillerList.append(animalNotKillerList[indexPath.row])
        }else{
            print("💩💩💩💩Select \(animalKillerList[indexPath.row].name!)")
            //remove
            //animalKillerList.remove(at: indexPath.row)
            //add
            animalKillerList.append(animalKillerList[indexPath.row])
            
        }
        tableView.reloadData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //fire when someone click on retunr keyborad
        self.view.endEditing(true)
        return true
    }
}
