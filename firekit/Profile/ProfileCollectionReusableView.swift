//
//  ProfileCollectionReusableView.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-02.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class ProfileCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var userDetailsStackView: UIStackView!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var profileImageContainerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.profileImageContainerView.layer.borderColor = UIColor.init(named: "Magnesium")?.cgColor
        self.profileImageContainerView.layer.borderWidth = 0.5

        self.userDetailsStackView.addBorder(toSide: .Bottom, withColor: UIColor.init(named: "Magnesium")!.cgColor, andThickness: 0.5)
    }

}
