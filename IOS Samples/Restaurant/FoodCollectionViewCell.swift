//
//  FoodCollectionViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 26/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var labelFoodName: UILabel!
    var food : Food?
    func setFoof(food : Food){
        imageFood.image = UIImage(named: food.image!)
        labelFoodName.text = food.name!
    }
    
}
