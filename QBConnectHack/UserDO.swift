//
//  User.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/22/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit
import Parse

class UserDO: PFObject, PFSubclassing {
    
    @NSManaged var userFirstName : String?
    @NSManaged var userLastName : String?
    @NSManaged var userEmail : String?
    @NSManaged var userContact : String?
    
    
    static func parseClassName() -> String {
        return "QBUser"
    }
    
    override init() {
        super.init()
    }
    
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
