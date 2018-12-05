//
//  NotificationFollowTableViewCell.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-03.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class NotificationFollowTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: ProfileImageView!
    @IBOutlet weak var notificationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
