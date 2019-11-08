//
//  ProfileViewController.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-01.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var postsCollectionView: UICollectionView!

    // Number of items per row
    let itemsPerRow: CGFloat = 3

    // Spacing between cells
    let inset: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Profile"

        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        navigationItem.rightBarButtonItem = logoutButton

        self.postsCollectionView.register(UINib.init(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostCollectionViewCell")

        self.postsCollectionView.register(UINib.init(nibName: "ProfileCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileCollectionReusableView")

        let screenSize = UIScreen.main.bounds
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.itemSize = CGSize(width: screenSize.width / itemsPerRow - inset, height: screenSize.width / itemsPerRow - inset)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.postsCollectionView.collectionViewLayout = layout
    }

    @objc func logoutButtonTapped() {
        UIApplication.shared.windows[0].rootViewController = LoginViewController()
    }
}

extension ProfileViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

}

extension ProfileViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath)

        if let postcell = cell as? PostCollectionViewCell {
            postcell.imageView.image = UIImage.init(named: "post\(indexPath.row % 12 + 1)")
        }

        return cell
    }

}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.frame.size.width, height: 280.0)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileCollectionReusableView", for: indexPath)

        return headerView
    }

}
