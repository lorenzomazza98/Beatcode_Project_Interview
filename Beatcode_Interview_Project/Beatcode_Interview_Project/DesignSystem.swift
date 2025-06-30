//
//  DesignSystem.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

// Modern color palette with adaptive light/dark mode
struct Palette {
    static let primary = Color(uiColor: .systemIndigo)
    static let secondary = Color(uiColor: .systemTeal)
    static let background = Color(uiColor: .secondarySystemGroupedBackground)
    
    static func rowBackground(index: Int) -> Color {
        index % 2 == 0 ? Color(uiColor: .systemGray6) : Color(uiColor: .systemBackground)
    }
}

// Gradient for visual depth
extension View {
    func modernGradient() -> some View {
        self.background(
            LinearGradient(
                gradient: Gradient(colors: [Palette.primary.opacity(0.05), .clear]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}
