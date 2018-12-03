//
//  CommentsViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-02.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var composerView: ComposerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addDismissKeyboardGesture()
        
        self.composerView.delegate = self
        
        KeyboardAvoiding.avoidingView = self.composerView

        self.commentsTableView.register(UINib(nibName: "CommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentsTableViewCell")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataAccessManager.shared.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell") as! CommentsTableViewCell
        
        guard let user = DataAccessManager.shared.users[indexPath.row] else {
            return cell
        }

        cell.profileImageView.image = user.profileImage
        cell.commentLabel.text = "\(user.firstName!) \(user.lastName!) Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension CommentsViewController: ComposerViewDelegate {
    
    func sendButtonPressed(_ sender: String) {
//        DataAccessManager.shared.messages.append(Message(text: sender, type: .Sent))
//
//        self.commentsTableView.beginUpdates()
//        self.commentsTableView.insertRows(at: [IndexPath(row: DataAccessManager.shared.users.count - 1, section: 0)], with: .automatic)
//        self.commentsTableView.endUpdates()
//
//        self.commentsTableView.scrollToBottom(DataAccessManager.shared.users as Array<Any>)
    }
    
    func didBeginEditing(_ sender: UITextField) {
//        self.commentsTableView.scrollToBottom(DataAccessManager.shared.users as Array<Any>)
    }
}
