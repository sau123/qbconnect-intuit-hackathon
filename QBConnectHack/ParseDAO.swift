//
//  User.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/22/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit
import Parse

class ParseDAO: NSObject {
    
    var className : String!
    
    init(className : String) {
        self.className = className
    }
    
    func upsert(pfObject :  PFObject, completion : (Bool, PFObject?, NSError?) -> Void) {
        pfObject.saveInBackgroundWithBlock { (created: Bool, error: NSError?) -> Void in
            completion(created, pfObject, error)
        }
    }
}
