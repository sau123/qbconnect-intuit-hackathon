//
//  UserCell.swift
//  QBConnectHack
//
//  Created by Saumeel Gajera on 10/23/16.
//  Copyright © 2016 Saumeel Gajera. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
