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
    
    var messages = [Message(text: "Hello this is B", type: .Sent),
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
    
    var users = [User(firstName: "Sara", lastName: "Doe", profileImage: UIImage.init(named: "profile1")!),
                 User(firstName: "Jennifer", lastName: "Doe", profileImage: UIImage.init(named: "profile2")!),
                 User(firstName: "Megan", lastName: "Doe", profileImage: UIImage.init(named: "profile3")!),
                 User(firstName: "Julia", lastName: "Doe", profileImage: UIImage.init(named: "profile4")!),
                 User(firstName: "John", lastName: "Doe", profileImage: UIImage.init(named: "profile5")!)]
}
