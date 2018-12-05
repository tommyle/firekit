//
//  DataAccessManager.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class DataAccessManager: NSObject {
    
    static let shared = DataAccessManager()
    
    var messages = [Message?]()
    var users = [User?]()
    var notifications = [Notification?]()
    
    private override init() {
        messages = [Message(text: "Hello this is B", type: .Sent),
                    Message(text: "Hi B how are you?", type: .Received),
                    Message(text: "Hi B how are you? Hi B how are you? Hi B how are you?", type: .Sent),
                    Message(text: "Hi B how are you?", type: .Received),
                    Message(text: "Hi B how are you? Hi B how are you? Hi B how are you? Hi B how are you? Hi B how are you? Hi B how are you?", type: .Sent),
                    Message(text: "Test", type: .Received),
                    Message(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled", type: .Sent),
                    Message(text: "Hello this is B", type: .Sent),
                    Message(text: "Hi B how are you?", type: .Received),
                    Message(text: "Hi B how are you? Hi B how are you? Hi B how are you?", type: .Sent),
                    Message(text: "Hi B how are you?", type: .Sent),
                    Message(text: "Hello this is B", type: .Sent),
                    Message(text: "Hi B how are you?", type: .Received),
                    Message(text: "Hi B how are you? Hi B how are you? Hi B how are you?", type: .Received),
                    Message(text: "Hi B how are you?", type: .Received)]
        
        users = [User(userName: "sara_doe", firstName: "Sara", lastName: "Doe", profileImage: UIImage.init(named: "profile1")!),
                 User(userName: "jennifer_doe", firstName: "Jennifer", lastName: "Doe", profileImage: UIImage.init(named: "profile2")!),
                 User(userName: "megan_doe", firstName: "Megan", lastName: "Doe", profileImage: UIImage.init(named: "profile3")!),
                 User(userName: "julia_doe", firstName: "Julia", lastName: "Doe", profileImage: UIImage.init(named: "profile4")!),
                 User(userName: "john_doe", firstName: "John", lastName: "Doe", profileImage: UIImage.init(named: "profile5")!)]
        
        notifications = [Notification(user: users[0]!, type: .Liked, date: Date.dateMinus(day: 1), likedImage: UIImage.init(named: "post1")!),
                         Notification(user: users[1]!, type: .Liked, date: Date.dateMinus(day: 1), likedImage: UIImage.init(named: "post2")!),
                         Notification(user: users[3]!, type: .Liked, date: Date.dateMinus(day: 1), likedImage: UIImage.init(named: "post3")!),
                         Notification(user: users[4]!, type: .Liked, date: Date.dateMinus(day: 2), likedImage: UIImage.init(named: "post4")!),
                         Notification(user: users[0]!, type: .Followed, date: Date.dateMinus(day: 2)),
                         Notification(user: users[1]!, type: .Liked, date: Date.dateMinus(day: 2), likedImage: UIImage.init(named: "post5")!),
                         Notification(user: users[2]!, type: .Followed, date: Date.dateMinus(day: 3)),
                         Notification(user: users[3]!, type: .Followed, date: Date.dateMinus(day: 3)),
                         Notification(user: users[4]!, type: .Liked, date: Date.dateMinus(day: 5), likedImage: UIImage.init(named: "post6")!)]
    }
    
    
}
