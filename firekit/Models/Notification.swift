//
//  Notification.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-04.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

enum NotificationType {
    case Followed
    case Liked
}

class Notification: NSObject {
    var user: User!
    var type: NotificationType!
    var text: String!
    var date: Date!
    var likedImage: UIImage?
    
    convenience init? (user: User, type: NotificationType, date: Date) {
        self.init()
        
        self.user = user
        self.type = type
        self.date = date
        
        self.text = initMessage()
    }
    
    convenience init? (user: User, type: NotificationType, date: Date, likedImage: UIImage) {
        self.init(user: user, type: type, date: date)
        self.likedImage = likedImage
    }
    
    private func initMessage() -> String! {
        let daysSince = self.date.daysSince(date: Date())
        
        if (self.type == .Followed) {
            return "\(self.user.userName!) started following you. \(daysSince!)"
        }
        else {
            return  "\(self.user.userName!) liked your photo. \(daysSince!)"
        }
    }
}
