//
//  PostTableViewCell.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.postImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner];
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
