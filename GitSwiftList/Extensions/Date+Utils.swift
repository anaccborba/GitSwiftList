//
//  Date+Utils.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//
import Foundation

extension Date {
    
    static func convertTimestampString(_ timestamp: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime] // Define o formato correto
        return formatter.date(from: timestamp)
    }
    
    func dateFormattedBR() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d/MM/yyyy"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: self)
    }
}
