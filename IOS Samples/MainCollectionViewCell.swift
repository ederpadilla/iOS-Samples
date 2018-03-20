//
//  MainCollectionViewCell.swift
//  IOS Samples
//
//  Created by Eder Padilla on 16/03/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mImgBgCell: UIImageView!
    @IBOutlet weak var mCellName: UILabel!
    
    func setCellProperties(mainCell : MainCellObject){
        self.mCellName.text = mainCell.name!
        self.mImgBgCell.contentMode = .scaleAspectFit
        self.mImgBgCell.image = UIImage(named: mainCell.image!)
    }
    
}
