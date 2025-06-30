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
                    ForEach($dataService.items) { $item in
                        NavigationLink(destination: DetailView(item: $item)) {
                            ListCellView(item: $item)
                                .contentShape(Rectangle()) // Makes entire cell tappable
                        }
                        .swipeActions(edge: .trailing) {
                            Button(action: { item.isFavourite.toggle() }) {
                                Label("Favorite", systemImage: "star")
                            }
                            .tint(.yellow)
                        }
                    }
                }
                .navigationTitle("Items")
            }
        }
}
