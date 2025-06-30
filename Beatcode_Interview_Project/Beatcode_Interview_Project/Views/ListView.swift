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
        List {
            ForEach($dataService.items) { $item in
                ListCellView(item: $item)
                    .listRowBackground(
                        dataService.items.firstIndex(where: { $0.id == item.id })! % 2 == 0
                                                ? Color.blue.opacity(0.1)
                                                : Color.clear
                    )
            }
        }
        .navigationTitle("Items")
    }
}
