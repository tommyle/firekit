//
//  ActivityFeedViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class ActivityFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, PostTableViewCellDelegate {

    @IBOutlet weak var feedTableView: UITableView!
    var storiesCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 10, bottom: 4, right: 10)
        layout.itemSize = CGSize(width: 66, height: 86)
        layout.scrollDirection = .horizontal
        let frame = CGRect(x: 0, y: 0, width: 2000, height: 98)

        self.storiesCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        self.storiesCollectionView.backgroundColor = UIColor.clear
        self.storiesCollectionView.register(UINib.init(nibName: "StoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        self.storiesCollectionView.delegate = self
        self.storiesCollectionView.dataSource = self
        self.storiesCollectionView.showsHorizontalScrollIndicator = false
        self.storiesCollectionView.addBorder(toSide: .bottom, withColor: UIColor.init(named: "Magnesium")!.cgColor, andThickness: 0.4)

        self.feedTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        self.feedTableView.tableFooterView = UIView()
        self.feedTableView.tableHeaderView = storiesCollectionView
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") else {
            return UITableViewCell()
        }

        if let postCell = cell as? PostTableViewCell {
            postCell.delegate = self
            postCell.postImageView.image = UIImage.init(named: "post\(indexPath.row + 1)")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath)

        if let storiesCell = cell as? StoriesCollectionViewCell {
            storiesCell.profileImage.image = UIImage.init(named: "profile\((indexPath.row % 5) + 1)")
        }

        return cell
    }

    func commentsButtonPressed(_ sender: Any) {
        let commentsViewController = CommentsViewController()
        commentsViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(commentsViewController, animated: true)
    }

    func likeButtonPressed(_ sender: Any) {
    }

    func shareButtonPressed(_ image: UIImage) {
        let imageToShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
}
