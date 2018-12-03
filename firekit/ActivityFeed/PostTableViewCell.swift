//
//  PostTableViewCell.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

protocol PostTableViewCellDelegate: class {
    func likeButtonPressed(_ sender: Any)
    func shareButtonPressed(_ sender: Any)
    func commentsButtonPressed(_ sender: Any)
}

class PostTableViewCell: UITableViewCell, PostTableViewCellDelegate {
    
    weak var delegate: PostTableViewCellDelegate?

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var liked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.postImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner];
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setLikeButtonImage() {
        let likeButtonImage = liked ? UIImage.init(named: "likeFilled") : UIImage.init(named: "like")
        
        self.likeButton.setImage(likeButtonImage, for: .normal)
    }
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        self.liked = !liked
        self.setLikeButtonImage()
        
        delegate?.likeButtonPressed(sender)
    }
    
    @IBAction func commentsButtonPressed(_ sender: Any) {
        delegate?.commentsButtonPressed(sender)
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        delegate?.shareButtonPressed(sender)
    }
    
}
