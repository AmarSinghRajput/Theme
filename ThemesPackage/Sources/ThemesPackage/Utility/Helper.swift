//
//  File.swift
//  
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import Foundation

public func getRandomHexColor() -> String {
    let letters = "0123456789ABCDEF"
    var color = "#"
    for _ in 0..<6 {
        color.append(letters.randomElement()!)
    }
    return color
}
