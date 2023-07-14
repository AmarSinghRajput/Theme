//
//  ThemeData.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import SwiftUI

public struct ThemeData: Codable, Hashable, Equatable {
    public let name: String
    public let colors: ColorData
    public let shapes: ShapeData
    public let spacing: SpacingData
    public let typography: TypographyData
    
    // Implement the Hashable protocol
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(colors)
        hasher.combine(shapes)
        hasher.combine(spacing)
        hasher.combine(typography)
    }
    
    // Implement the Equatable protocol
    public static func ==(lhs: ThemeData, rhs: ThemeData) -> Bool {
        return lhs.name == rhs.name &&
        lhs.colors == rhs.colors &&
        lhs.shapes == rhs.shapes &&
        lhs.spacing == rhs.spacing &&
        lhs.typography == rhs.typography
    }
}
