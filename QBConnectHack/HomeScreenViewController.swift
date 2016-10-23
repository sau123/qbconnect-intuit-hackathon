//
//  HomeScreenViewController.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/22/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit
import Parse
import Alamofire

class HomeScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var customers : [UserDO]?
    
    var user = UserDO()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("email : \(user.userEmail)")
        print("pswd : \(user.password)")
        
        print("making alamo request")
        let parameters : [ String : String]
          = [
            "oauth_customer_key": "qyprdDvFLbXqTDMsUoLIygz81s8oxI",
            "oauth_token": "lvprdGh6mZ0YyQQ3fQqD5duqnD9h3ftapUgXnwcLHYDbW5lt",
            "oauth_signature_method": "HMAC-SHA1"
        ]
        Alamofire.request(.GET, "https://quickbooks.api.intuit.com/v3/company/123145711296839/companyinfo/123145711296839?minorversion=4", parameters: parameters)
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        return UITableViewCell()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
