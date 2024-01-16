//
//  DateFormat.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/16.
//

import UIKit

extension DateFormatter {
    static var format = DateFormatter()
    
    static func changeDateFormatter(dateString: String, newDateFormat: String) -> String {
        DateFormatter.format.dateFormat = "yyyy-MM-dd"
        
        let backToDate: Date = DateFormatter.format.date(from: dateString) ?? Date()
        
        DateFormatter.format.dateFormat = newDateFormat
        let result = DateFormatter.format.string(from: backToDate)
        
        return result
    }
}
