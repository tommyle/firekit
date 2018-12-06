//
//  Message.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

enum MessageType {
    case sent
    case received
}

class Message: NSObject {
    var text: String!
    var type: MessageType!

    convenience init?(text: String, type: MessageType) {
        self.init()

        self.text = text
        self.type = type
    }

}
