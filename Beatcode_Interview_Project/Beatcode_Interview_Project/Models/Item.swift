//
//  Item.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    var isFavourite: Bool
    let color: Color // Add color property
    
    // Initialize with generated color
    init(title: String, isFavourite: Bool, index: Int) {
        self.title = title
        self.isFavourite = isFavourite
        self.color = ColorGenerator.color(for: index)
    }
}

