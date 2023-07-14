//
//  TypographyData.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import SwiftUI

public struct TypographyData: Codable, Hashable, Equatable {
    public struct TextStyle: Codable, Hashable, Equatable {
        let name: String
        let size: CGFloat
        
        // Implementing the Hashable protocol
        public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(size)
        }
        // Implementing the equitable protocol
        public static func ==(lhs: TextStyle, rhs: TextStyle) -> Bool {
            return lhs.name == rhs.name && lhs.size == rhs.size
        }
    }
    
    public let h1: TextStyle
    public let h2: TextStyle
    public let h3: TextStyle
    public let h4: TextStyle
    public let h5: TextStyle
    public let h6: TextStyle
    public let body1: TextStyle
    public let body2: TextStyle
    
    // Implement the Hashable protocol
    public func hash(into hasher: inout Hasher) {
        hasher.combine(h1)
        hasher.combine(h2)
        hasher.combine(h3)
        hasher.combine(h4)
        hasher.combine(h5)
        hasher.combine(h6)
        hasher.combine(body1)
        hasher.combine(body2)
    }
    
    // Implement the Equatable protocol
    public static func ==(lhs: TypographyData, rhs: TypographyData) -> Bool {
        return lhs.h1 == rhs.h1 &&
        lhs.h2 == rhs.h2 &&
        lhs.h3 == rhs.h3 &&
        lhs.h4 == rhs.h4 &&
        lhs.h5 == rhs.h5 &&
        lhs.h6 == rhs.h6 &&
        lhs.body1 == rhs.body1 &&
        lhs.body2 == rhs.body2
    }
}
