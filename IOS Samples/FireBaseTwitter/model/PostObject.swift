//
//  PostObject.swift
//  IOS Samples
//
//  Created by Eder Padilla on 13/02/18.
//  Copyright © 2018 Eder Padilla. All rights reserved.
//

import UIKit

class PostObject: NSObject {
    var posttext : String?
    var userUid : String?
    var postDate : String?
    var postImage : String?
    init(posttext : String,userUid : String,postDate : String,postImage : String) {
        self.posttext = posttext
        self.userUid = userUid
        self.postDate = postDate
        self.postImage = postImage
    }
    
}
