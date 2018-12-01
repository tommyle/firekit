//
//  ChatViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-11-30.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var composerView: ComposerView!
    
    var messages = ["Hello this is B",
                    "Hi B how are you?",
                    "Hi B how are you? Hi B how are you? Hi B how are you?",
                    "Hi B how are you?",
                    "Hi B how are you? Hi B how are you? Hi B how are you? Hi B how are you? Hi B how are you? Hi B how are you?",
                    "Test",
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                    "Hello this is B",
                    "Hi B how are you?",
                    "Hi B how are you? Hi B how are you? Hi B how are you?",
                    "Hi B how are you?",
                    "Hello this is B",
                    "Hi B how are you?",
                    "Hi B how are you? Hi B how are you? Hi B how are you?",
                    "Hi B how are you?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.composerView.delegate = self
        
        self.chatTableView.register(UINib(nibName: "MessagesSentTableViewCell", bundle: nil), forCellReuseIdentifier: "MessagesSentTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesSentTableViewCell") as! MessagesSentTableViewCell
        
        cell.messageLabel.text = messages[indexPath.row]
        
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
        self.messages.append(sender)
        
        chatTableView.beginUpdates()
        chatTableView.insertRows(at: [IndexPath(row: self.messages.count - 1, section: 0)], with: .automatic)
        chatTableView.endUpdates()
        
        self.scrollToBottom(self.chatTableView, self.messages)
    }
}
