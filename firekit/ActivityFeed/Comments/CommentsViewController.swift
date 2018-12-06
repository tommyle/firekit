//
//  CommentsViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-02.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var composerView: ComposerView!

    let data = DataAccessManager.shared.users

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addDismissKeyboardGesture()

        self.composerView.delegate = self

        KeyboardAvoiding.avoidingView = self.composerView

        self.commentsTableView.register(UINib(nibName: "CommentsTableViewCell", bundle: nil),
                                        forCellReuseIdentifier: "CommentsTableViewCell")

        self.commentsTableView.scrollToBottom(self.data as [Any])
    }

}

extension CommentsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

}

extension CommentsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell") as? CommentsTableViewCell else {
            return UITableViewCell()
        }

        guard let user = self.data[indexPath.row] else {
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
    }

    func didBeginEditing(_ sender: UITextField) {
        self.commentsTableView.scrollToBottom(self.data as [Any])
    }
}
