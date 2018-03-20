//
//  Food.swift
//  IOS Samples
//
//  Created by Eder Padilla on 26/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class Food: NSObject {
    var name : String?
    var des : String?
    var image : String?
    init(name : String, des:String,image:String) {
        self.name = name
        self.des = des
        self.image = image
    }
}
