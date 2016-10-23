//
//  SignInViewController.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/22/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit
import Parse


class SignInViewController: UIViewController {

    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var user : UserDO?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(sender: UIButton) {
        let query = PFQuery(className: "QBUser")
        query.whereKey("userEmail", equalTo: emailID.text!)
        query.whereKey("password", equalTo: password.text!)
        
        
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) in
            if error == nil{
                print("there is a user with this name")
                self.user = objects![0] as? UserDO
                print(self.user?.userEmail)
                self.performSegueWithIdentifier(Constants.homeScreenSegue, sender: nil)
            }else{
                //error
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == Constants.homeScreenSegue {
            
            let destinationVC = segue.destinationViewController as! HomeScreenViewController
            destinationVC.user = user!
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
