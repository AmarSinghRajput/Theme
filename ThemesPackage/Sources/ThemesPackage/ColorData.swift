//
//  ColorData.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//

import SwiftUI

public struct ColorData: Codable, Hashable, Equatable {
    let primary: String
    let primaryVariant: String
    let secondary: String
    let background: String
    let surface: String
    let onPrimary: String
    let onBackground: String
    let onSurface: String
    let error: String
    let onError: String
    let festive: String
    
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
