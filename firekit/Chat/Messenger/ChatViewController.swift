//
//  ChatViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-11-30.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var composerView: ComposerView!
    var viewHasBeenSet = false
    
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
            self.scrollToBottom(self.chatTableView, DataAccessManager.shared.messages as Array<Any>)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataAccessManager.shared.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let message = DataAccessManager.shared.messages[indexPath.row] else {
            return UITableViewCell()
        }
        
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
        DataAccessManager.shared.messages.append(Message(text: sender, type: .Sent))
        
        self.chatTableView.beginUpdates()
        self.chatTableView.insertRows(at: [IndexPath(row: DataAccessManager.shared.messages.count - 1, section: 0)], with: .automatic)
        self.chatTableView.endUpdates()
        
        self.scrollToBottom(self.chatTableView, DataAccessManager.shared.messages as Array<Any>)
    }
    
    func didBeginEditing(_ sender: UITextField) {
        self.scrollToBottom(self.chatTableView, DataAccessManager.shared.messages as Array<Any>)
    }
}
