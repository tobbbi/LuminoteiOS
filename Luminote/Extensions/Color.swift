//  Color.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 18.01.25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        guard let rgb = UInt64(hexSanitized.replacingOccurrences(of: "#", with: ""), radix: 16) else {
            // Wenn das Scannen fehlschlägt, ist ein ungültiger Hexwert
            self = .black  // Default-Farbe, wenn der Hex-Wert ungültig ist
            return
        }
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    static let customSliderColor = Color(hex: "#7EA398")
    
    static let buttonBackgroundColor = Color(hex: "#49776A")  // Neue Hintergrundfarbe für den Button
}
