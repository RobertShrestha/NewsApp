//
//  DateHelper.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//

import Foundation
struct DateHelper {
    static func timeToDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale =  Locale(identifier: "yyyy-MM-dd'T'HH:mm:ssZ")
        return dateFormatter.date(from: dateString) ?? Date()
    }
}
