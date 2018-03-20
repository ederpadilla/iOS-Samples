//
//  ChatModel.swift
//  IOS Samples
//
//  Created by Eder Padilla on 08/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class ChatModel: NSObject {
    var nickName : String?
    var message : String?
    var date : String?
    init(nickName : String,message : String,date : String) {
        self.nickName = nickName
        self.message = message
        self.date = date
    }
}
