//
//  ChatListViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController {

    @IBOutlet weak var chatListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Messages"

        self.addDismissKeyboardGesture()

        self.chatListTableView.register(UINib(nibName: "ChartListTableViewCell", bundle: nil), forCellReuseIdentifier: "ChartListTableViewCell")

        self.chatListTableView.tableHeaderView = self.initSearchBar()

        // Hides empty cells
        self.chatListTableView.tableFooterView = UIView()
    }

    func initSearchBar() -> UISearchBar {
        let searchBar = UISearchBar.init(frame: CGRect(x: 0, y: 0, width: 375, height: 56))
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = UIColor.white
        searchBar.placeholder = "Search"

        return searchBar
    }

}

extension ChatListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataAccessManager.shared.users.count
    }

}

extension ChatListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChartListTableViewCell") as? ChartListTableViewCell else {
            return UITableViewCell()
        }

        guard let user = DataAccessManager.shared.users[indexPath.row] else {
            return UITableViewCell()
        }

        cell.profileImage.image = user.profileImage
        cell.nameLabel.text = "\(user.firstName!) \(user.lastName!)"

        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController()
        chatViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatViewController, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }

}
