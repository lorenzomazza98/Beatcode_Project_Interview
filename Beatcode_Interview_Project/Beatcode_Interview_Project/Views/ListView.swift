//
//  ListView.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

struct ListView: View {
    @StateObject private var dataService = DataService()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array($dataService.items.enumerated()), id: \.element.id) { index, $item in
                    NavigationLink(destination: DetailView(item: $item)) {
                        ListCellView(item: $item, index: index)
                            .contentShape(Rectangle())
                            .modernGradient()
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: { item.isFavorite.toggle() }) {
                            Label("Favorite", systemImage: "star")
                        }
                        .tint(.yellow)
                    }
                    .listRowBackground(Palette.rowBackground(index: index))
                    .listRowSeparatorTint(Palette.primary.opacity(0.3))
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Featured Items")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .accessibilityLabel("Filter options")
                    }
                }
            }
        }
        .tint(Palette.primary)
    }
}
