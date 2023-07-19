//
//  Theme.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//


import SwiftUI

@available(iOS 14.0, *)
public class ThemeManager: ObservableObject {
    @Published public var themes: [ThemeData] = []
    @AppStorage(UserDefaultsKeys.selectedTheme) public var selectedTheme: String = ""
    @AppStorage(UserDefaultsKeys.currentThemeIndex) public var currentThemeIndex: Int = 0 {
        didSet {
            updateSelectedTheme()
        }
    }
    public var currentTheme: ThemeData? {
        themes.first { $0.name == selectedTheme }
    }
    
    public init(themes: [ThemeData] = []) {
        self.themes = themes
        if let defaultTheme = themes.first?.name, selectedTheme == "" {
            selectedTheme = defaultTheme
        }
        saveThemesToUserDefaults()
    }
}

extension ThemeManager {
    public func saveThemesToUserDefaults() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(themes) {
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsKeys.themes)
        }
    }
    
    public func loadThemesFromUserDefaults() -> [ThemeData] {
        if let encodedData = UserDefaults.standard.data(forKey: UserDefaultsKeys.themes) {
            let decoder = JSONDecoder()
            if let decodedThemes = try? decoder.decode([ThemeData].self, from: encodedData) {
                return decodedThemes
            }
        }
        return []
    }
    
    
    public func updateSelectedTheme() {
        guard currentThemeIndex >= 0 && currentThemeIndex < themes.count else {
            return
        }
        selectedTheme = themes[currentThemeIndex].name
    }
    
    public func addThemes(_ theme: ThemeData) {
        var updatedThemes = loadThemesFromUserDefaults()
        updatedThemes.append(theme)
        saveThemesToUserDefaults(updatedThemes)
        themes = updatedThemes
    }
    
    private func saveThemesToUserDefaults(_ themes: [ThemeData]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(themes) {
            UserDefaults.standard.set(encodedData, forKey: UserDefaultsKeys.themes)
        }
    }
}

extension ThemeManager {
    public func currentThemeColor(_ keyPath: KeyPath<ColorData, String>) -> Color {
        guard let currentTheme = currentTheme else {
            return Color.clear
        }
        let colorValue = currentTheme.colors[keyPath: keyPath]
        return Color(hex: colorValue)
    }
}
