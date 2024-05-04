//
//  Date.swift
//  ToDoList
//
//  Created by Daniel Berg on 03/05/24.
//

import Foundation

extension Date {
    public func convertDateToString(date:Date, dateFormatter:String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd h:mm a" //"yyyy-MM-dd'T'h:mm a"
        let dateString = formatter.string(from: date)
        let finalDate = formatter.date(from: dateString)
        
        formatter.dateFormat = dateFormatter ?? "yyyy-MM-dd h:mm a"
        return formatter.string(from: finalDate!)
    }
    
    public func convertStringToDate(dateString:String, dateFormatter:String?) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd h:mm a"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter.date(from: dateString) ?? nil
    }
}
