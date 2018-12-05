//
//  StyleHelper.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-05.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

class StyleHelper: NSObject {

    static func notificationStyle(userName: String, action: String, daysSince: String) -> NSAttributedString! {
        let font = UIFont.systemFont(ofSize: 15)
        let fontBold = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        let attributes1 = [NSAttributedString.Key.font: fontBold]
        let attributes2 = [NSAttributedString.Key.font: font]
        let attributes3 = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.doveGray]
        
        let nameAttributedString = NSAttributedString(string: userName, attributes: attributes1 as [NSAttributedString.Key : Any])
        let actionAttributedString = NSAttributedString(string: action, attributes: attributes2 as [NSAttributedString.Key : Any])
        let dayAttributedString = NSAttributedString(string: daysSince, attributes: attributes3 as [NSAttributedString.Key : Any])
        
        let result = NSMutableAttributedString()
        result.append(nameAttributedString)
        result.append(actionAttributedString)
        result.append(dayAttributedString)
        
        return result
    }
    
}
