//
//  User.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var firstName: String!
    var lastName: String!
    var profileImage: UIImage!
    
    convenience init?(firstName: String, lastName: String, profileImage: UIImage) {
        self.init()
        
        self.firstName = firstName
        self.lastName = lastName
        self.profileImage = profileImage
    }
    
}
