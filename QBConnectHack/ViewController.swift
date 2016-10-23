//
//  ViewController.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/22/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var contactNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var state: UITextField!
    
    var userDO = UserDO()
    var parseDAO = ParseDAO(className: "QBUser");
    
    @IBAction func submit(){
        // make a n/w call to send the data
        print("firstName : \(firstName.text)")
        print("lastName : \(lastName.text)")
        print("Email ID  : \(emailID.text)")
        print("contact No : \(contactNumber.text)")
        
        userDO.userFirstName = firstName.text ?? ""
        userDO.userLastName = lastName.text ?? ""
        userDO.userEmail = emailID.text ?? ""
        userDO.userContact = contactNumber.text ?? ""
        userDO.password = password.text ?? ""
        userDO.state = state.text ?? ""
        

        parseDAO.upsert(userDO) { (created : Bool, pfObject : PFObject?, error :  NSError?) in
            
            // segue to another VC
            self.performSegueWithIdentifier(Constants.userCreatedSegue, sender: nil)
            print("user created ... \(created)")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destinationVC = segue.destinationViewController as! UserCreatedViewController
        destinationVC.user = userDO
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

