//
//  ChatViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-11-30.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

enum MessageType {
    case Sent
    case Received
}

struct Message {
    var text: String
    var type: MessageType
}

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var composerView: ComposerView!
    var viewHasBeenSet = false
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addDismissKeyboardGesture()
        
        self.composerView.delegate = self
        
        KeyboardAvoiding.avoidingView = self.composerView
        
        self.chatTableView.register(UINib(nibName: "MessagesSentTableViewCell", bundle: nil), forCellReuseIdentifier: "MessagesSentTableViewCell")
        self.chatTableView.register(UINib(nibName: "MessagesReceivedTableViewCell", bundle: nil), forCellReuseIdentifier: "MessagesReceivedTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (!self.viewHasBeenSet) {
            self.viewHasBeenSet = true
            self.scrollToBottom(self.chatTableView, self.messages)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.messages[indexPath.row]
        
        let cellIdentifier = message.type == .Sent ? "MessagesSentTableViewCell" : "MessagesReceivedTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        switch cell {
        case is MessagesSentTableViewCell:
            (cell as! MessagesSentTableViewCell).messageLabel.text = message.text
        default:
            (cell as! MessagesReceivedTableViewCell).messageLabel.text = message.text
        }
        
        return cell
    }
    
    func scrollToBottom(_ tableView: UITableView, _ data: Array<Any>){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: data.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

extension ChatViewController: ComposerViewDelegate {
    
    func sendButtonPressed(_ sender: String) {
        self.messages.append(Message(text: sender, type: .Sent))
        
        self.chatTableView.beginUpdates()
        self.chatTableView.insertRows(at: [IndexPath(row: self.messages.count - 1, section: 0)], with: .automatic)
        self.chatTableView.endUpdates()
        
        self.scrollToBottom(self.chatTableView, self.messages)
    }
    
    func didBeginEditing(_ sender: UITextField) {
        self.scrollToBottom(self.chatTableView, self.messages)
    }
}
