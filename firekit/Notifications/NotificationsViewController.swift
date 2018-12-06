//
//  NotificationsViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-03.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var notificationsTableView: UITableView!
    var data = DataAccessManager.shared.notifications

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Activity"

        self.notificationsTableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        self.notificationsTableView.register(UINib(nibName: "NotificationFollowTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationFollowTableViewCell")
    }

}

extension NotificationsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count * 3
    }

}

extension NotificationsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let notification = self.data[indexPath.row % self.data.count] else {
            return UITableViewCell()
        }

        let cellIdentifier = notification.type == .followed ? "NotificationFollowTableViewCell": "NotificationTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            return UITableViewCell()
        }

        if let followedCell = cell as? NotificationFollowTableViewCell {
            followedCell.profileImageView.image = notification.user.profileImage
            followedCell.notificationLabel.text = notification.text
        }

        if let likedCell = cell as? NotificationTableViewCell {
            likedCell.profileImageView.image = notification.user.profileImage
            likedCell.notificationLabel.text = notification.text
            likedCell.likedImageView.image = notification.likedImage
        }

        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
