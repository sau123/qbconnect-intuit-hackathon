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
    
//    var customers : [UserDO]?
    
    
    var user = UserDO()
    var customers = NetworkCall.getData()
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
        
        let urlPath: String = "https://quickbooks.api.intuit.com/v3/company/123145711296839/companyinfo/123145711296839?oauth_consumer_key=qyprdDvFLbXqTDMsUoLIygz81s8oxI&oauth_token=lvprdGh6mZ0YyQQ3fQqD5duqnD9h3ftapUgXnwcLHYDbW5lt&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1477211868&oauth_nonce=thcuwI&oauth_version=1.0&oauth_signature=s2WYYgiUzEsKGbdbJyUhyF9hcIY="
        let url: NSURL = NSURL(string: urlPath)!
        let queue:NSOperationQueue = NSOperationQueue()
        let request = NSMutableURLRequest(URL: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    print("ASynchronous\(jsonResult)")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })
        
        // Messaging
        let twilioAPI: String = "https://api.twilio.com/2010-04-01/Accounts/AC36fc4be9360cca1bd49bd0db10152d03/Messages"
        let urlT: NSURL = NSURL(string: twilioAPI)!
        let queueT:NSOperationQueue = NSOperationQueue()
        let requestT = NSMutableURLRequest(URL: urlT)
        requestT.addValue("application/json", forHTTPHeaderField: "Content-Type")
        requestT.addValue("application/json", forHTTPHeaderField: "Accept")
        
        requestT.addValue("Basic QUMzNmZjNGJlOTM2MGNjYTFiZDQ5YmQwZGIxMDE1MmQwMzpkYTcyY2Q1YzIwZmEwYWRiOTAxODc4YzRhYjE2MzExNQ==", forHTTPHeaderField: "Authorization")
        
//        var nwCall = NetworkCall()
//        var str = nwCall.httpBodyForParamsDictionary(dict)
//        requestT.HTTPBody = str
        print("request : \(requestT)")
        
        var swiftRequest = SwiftRequest();
        
        var data = [
            "To" : "+12012089051",
            "From" : "+14105411110",
            "Body" : "Hello World !!"
        ];
        
        swiftRequest.post("https://api.twilio.com/2010-04-01/Accounts/AC36fc4be9360cca1bd49bd0db10152d03/Messages",
                          auth: ["username" : "AC36fc4be9360cca1bd49bd0db10152d03", "password" : "da72cd5c20fa0adb901878c4ab163115"],
            data: data,
            callback: {err, response, body in
                if err == nil {
                    print("Success: \(response)")
                } else {
                    print("Error: \(err)")
                }
        });
        
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
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
