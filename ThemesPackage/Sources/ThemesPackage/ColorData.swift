//
//  ColorData.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import SwiftUI

public struct ColorData: Codable, Hashable, Equatable {
    public let primary: String
    public let primaryVariant: String
    public let secondary: String
    public let background: String
    public let surface: String
    public let onPrimary: String
    public let onBackground: String
    public let onSurface: String
    public let error: String
    public let onError: String
    public let festive: String
    
    // Implement the Hashable protocol
    public func hash(into hasher: inout Hasher) {
        hasher.combine(primary)
        hasher.combine(primaryVariant)
        hasher.combine(secondary)
        hasher.combine(background)
        hasher.combine(surface)
        hasher.combine(onPrimary)
        hasher.combine(onBackground)
        hasher.combine(onSurface)
        hasher.combine(error)
        hasher.combine(onError)
        hasher.combine(festive)
    }
    
    // Implement the Equatable protocol
    public static func ==(lhs: ColorData, rhs: ColorData) -> Bool {
        return lhs.primary == rhs.primary &&
        lhs.primaryVariant == rhs.primaryVariant &&
        lhs.secondary == rhs.secondary &&
        lhs.background == rhs.background &&
        lhs.surface == rhs.surface &&
        lhs.onPrimary == rhs.onPrimary &&
        lhs.onBackground == rhs.onBackground &&
        lhs.onSurface == rhs.onSurface &&
        lhs.error == rhs.error &&
        lhs.onError == rhs.onError &&
        lhs.festive == rhs.festive
    }
}
