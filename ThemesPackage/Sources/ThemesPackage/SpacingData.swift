//
//  SpacingData.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import SwiftUI

public struct SpacingData: Codable, Hashable, Equatable {
    let largeSpacing: CGFloat
    let mediumSpacing: CGFloat
    let smallSpacing: CGFloat
    let extraLargeSpacing: CGFloat
    
    // Implement the Hashable protocol
    public func hash(into hasher: inout Hasher) {
        hasher.combine(largeSpacing)
        hasher.combine(mediumSpacing)
        hasher.combine(smallSpacing)
        hasher.combine(extraLargeSpacing)
    }
    
    // Implement the Equatable protocol
    public static func ==(lhs: SpacingData, rhs: SpacingData) -> Bool {
        return lhs.largeSpacing == rhs.largeSpacing &&
        lhs.mediumSpacing == rhs.mediumSpacing &&
        lhs.smallSpacing == rhs.smallSpacing &&
        lhs.extraLargeSpacing == rhs.extraLargeSpacing
    }
}
