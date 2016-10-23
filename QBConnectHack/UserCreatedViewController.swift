//
//  UserCreatedViewController.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/22/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit
import Parse
class UserCreatedViewController: UIViewController {

    var user = UserDO()
    // displays that the user is created
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! UINavigationController
        let topVC = destinationVC.topViewController as! HomeScreenViewController
        
        topVC.user = user
        
    }
}
