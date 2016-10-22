//
//  ViewController.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/22/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var contactNumber: UITextField!
    
    
    
    @IBAction func submit(){
        // make a n/w call to send the data
        print("firstName : \(firstName.text)")
        print("lastName : \(lastName.text)")
        print("Email ID  : \(emailID.text)")
        print("contact No : \(contactNumber.text)")
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

