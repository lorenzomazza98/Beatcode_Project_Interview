//
//  Beatcode_Interview_ProjectApp.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

@main
struct Beatcode_Interview_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .preferredColorScheme(.dark) // 👈 Force dark mode for the entire app
        }
    }
}
