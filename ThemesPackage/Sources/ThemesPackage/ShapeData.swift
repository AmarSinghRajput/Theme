//
//  ShapeData.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import SwiftUI

public struct ShapeData: Codable, Hashable, Equatable {
    let largeCornerRadius: CGFloat
    let mediumCornerRadius: CGFloat
    let smallCornerRadius: CGFloat
    
    // Implement the Hashable protocol
    public func hash(into hasher: inout Hasher) {
        hasher.combine(largeCornerRadius)
        hasher.combine(mediumCornerRadius)
        hasher.combine(smallCornerRadius)
    }
    
    // Implement the Equatable protocol
    public static func ==(lhs: ShapeData, rhs: ShapeData) -> Bool {
        return lhs.largeCornerRadius == rhs.largeCornerRadius &&
        lhs.mediumCornerRadius == rhs.mediumCornerRadius &&
        lhs.smallCornerRadius == rhs.smallCornerRadius
    }
}
