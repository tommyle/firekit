//
//  UITableViewHelper.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-02.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

extension UITableView {

    func scrollToBottom(_ data: Array<Any>) {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: data.count - 1, section: 0)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }

}
