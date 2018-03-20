//
//  PokemonModel.swift
//  IOS Samples
//
//  Created by Eder Padilla on 25/01/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class PokemonModel: NSObject {
    var latitude : Double?
    var lontgitud : Double?
    var image : String?
    var name : String?
    var des : String?
    var power : Double?
    var isCatch : Bool?
    init(latitude : Double,lontgitud : Double,image : String,name : String,des : String,
         power : Double,isCatch : Bool) {
        self.latitude = latitude
        self.lontgitud = lontgitud
        self.image = image
        self.name = name
        self.des = des
        self.power = power
        self.isCatch = isCatch
    }
    
}
