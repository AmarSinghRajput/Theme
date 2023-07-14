//
//  Theme.swift
//  ThemePackage
//
//  Created by Amar Kumar Singh on 14/07/23.
//


import SwiftUI

@available(iOS 14.0, *)
public class ThemeManager: ObservableObject {
    @AppStorage("selectedTheme") public var selectedTheme: String = "light"
    @AppStorage("currentThemeIndex") public var currentThemeIndex: Int = 0 {
        didSet {
            updateSelectedTheme()
        }
    }
    public var currentTheme: ThemeData? {
        themes.first { $0.name == selectedTheme }
    }
    @Published public var themes: [ThemeData] = []
    public init() {
        loadThemesFromJSON()
    }
    
    public func loadThemesFromJSON() {
        if let url = Bundle.main.url(forResource: "themes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([String: [ThemeData]].self, from: data)
                self.themes = jsonData["themes"] ?? []
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    public func saveThemesToJSON() {
        let jsonData: [String: [ThemeData]] = ["themes": themes]
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(jsonData)
            if let url = Bundle.main.url(forResource: "themes", withExtension: "json") {
                try data.write(to: url)
            }
        } catch {
            print("Error encoding JSON: \(error)")
        }
    }
    
    public func updateSelectedTheme() {
        guard currentThemeIndex >= 0 && currentThemeIndex < themes.count else {
            return
        }
        selectedTheme = themes[currentThemeIndex].name
    }
   
    public func currentThemeColor(_ keyPath: KeyPath<ColorData, String>) -> Color {
        guard let currentTheme = currentTheme else {
            return Color.clear
        }
        let colorValue = currentTheme.colors[keyPath: keyPath]
        return Color(hex: colorValue)
    }
    
    public func addTheme(_ theme: ThemeData) {
        themes.append(theme)
        updateSelectedTheme()
        saveThemesToJSON()
    }
}


