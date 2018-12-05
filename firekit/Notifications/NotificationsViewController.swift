//
//  NotificationsViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-03.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var notificationsTableView: UITableView!
    var data = DataAccessManager.shared.users
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Activity"

        self.notificationsTableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        self.notificationsTableView.register(UINib(nibName: "NotificationFollowTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationFollowTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count * 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let user = self.data[indexPath.row % 5] else {
            return UITableViewCell()
        }

        if (indexPath.row % 3 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationFollowTableViewCell") as! NotificationFollowTableViewCell
            
            cell.profileImageView.image = user.profileImage
            cell.notificationLabel.text = "\(user.firstName!) \(user.lastName!) started following you. 3d"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell") as! NotificationTableViewCell
            
            cell.profileImageView.image = user.profileImage
            cell.notificationLabel.text = "\(user.firstName!) \(user.lastName!) liked your post. 2d"
            
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
