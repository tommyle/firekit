//
//  DateHelper.swift
//  firekit
//
//  Created by Tommy Le on 2018-12-04.
//  Copyright © 2018 Tommy Le. All rights reserved.
//

import UIKit

extension Date {

    func daysSince(date: Date) -> String! {
        let calendar = Calendar.current

        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)

        let components = calendar.dateComponents([.day], from: date1, to: date2)

        if components.day! > 0 {
            return "\(components.day!)d"
        } else if (components.hour! > 0) {
            return "\(components.hour!)h"
        } else if (components.minute! > 0) {
            return "\(components.minute!)m"
        } else {
            return "\(components.second!)s"
        }
    }

    static func dateMinus(day: Int) -> Date {
        var dayComp = DateComponents()
        dayComp.day = -1 * day
        return Calendar.current.date(byAdding: dayComp, to: Date()) ?? Date()
    }

    static func stringToDate(_ isoDate: String) -> Date! {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateFormatter.date(from: isoDate)!
        return date
    }
}
