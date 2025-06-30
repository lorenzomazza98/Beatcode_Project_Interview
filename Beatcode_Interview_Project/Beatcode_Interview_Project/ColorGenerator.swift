//
//  ColorGenerator.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

struct ColorGenerator {
    static func color(for index: Int) -> Color {
        // Golden ratio creates visually distinct colors
        let goldenRatio: Double = 0.618033988749895
        let hue = (Double(index) * goldenRatio).truncatingRemainder(dividingBy: 1.0)
        
        // HSB parameters for pleasant colors
        return Color(
            hue: hue,
            saturation: 0.7,
            brightness: 0.85,
            opacity: 1.0
        )
    }
}
