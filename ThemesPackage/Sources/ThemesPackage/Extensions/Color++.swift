//
//  Color++.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import SwiftUI

@available(iOS 13.0, *)
extension Color {
    public init(hex: String) {
        var formattedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if formattedHex.hasPrefix("#") {
            formattedHex.remove(at: formattedHex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: formattedHex).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
