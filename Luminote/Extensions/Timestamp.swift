//
//  Timestamp.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 10.01.25.
//

import Foundation
import Firebase

extension Date {
    func relativeTimestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self, to: Date()) ?? ""
    }
}


