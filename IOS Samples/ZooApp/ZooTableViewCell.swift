//
//  ZooTableViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 25/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class ZooTableViewCell: UITableViewCell {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var labelAnimalName: UILabel!
    @IBOutlet weak var animalDescription: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setAnimalProperties(animal : AnimalObject){
        self.labelAnimalName.text = animal.name!
        self.animalDescription.text = animal.des!
        self.animalImageView.image = UIImage(named: animal.image!)
    }

}
