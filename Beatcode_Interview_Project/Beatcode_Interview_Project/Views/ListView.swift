//
//  ListView.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

struct ListView: View {
    @StateObject private var dataService = DataService()
    @State private var showingFilters = false
    @State private var selectedFilter: FilterOption = .all
    
    enum FilterOption: String, CaseIterable {
        case all = "All Items"
        case favorites = "Favorites Only"
    }
    
    private var filteredItems: [Item] {
        switch selectedFilter {
        case .all:
            return dataService.items
        case .favorites:
            // Force re-evaluation when favorites change
            _ = dataService.items.filter(\.isFavourite)
            return dataService.items.filter { $0.isFavourite }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section(header: filterHeader) {
                    ForEach(filteredItems.indices, id: \.self) { index in
                        let item = filteredItems[index]
                        listRow(for: item, at: index)
                            .listRowBackground(Color.clear) // Clear default background
                            .listRowSeparator(.hidden) // Hide default separator
                            .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)) // Add spacing
                    }
                    
                    // Empty state for "Favorites Only" filter
                    if filteredItems.isEmpty && selectedFilter == .favorites {
                        emptyStateView
                    }
                }
            }
            .scrollContentBackground(.hidden) // Hide list background
            .background(Color.black) // Set overall background to black
            .listStyle(.plain) // Use plain list style
            .navigationTitle("Featured Items")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
                ToolbarItem(placement: .primaryAction) {
                    filterButton
                }
            }
            .sheet(isPresented: $showingFilters) {
                filterView
            }
        }
        .tint(Palette.primary)
        .animation(.smooth(duration: 0.3), value: selectedFilter)
    }
    
    // MARK: - List Row Builder
    @ViewBuilder
    private func listRow(for item: Item, at index: Int) -> some View {
        if let binding = binding(for: item) {
            // In listRow(for:at:) function:
            NavigationLink(destination: DetailView(item: binding, currentFilter: selectedFilter)) {
                ListCellView(item: binding, index: index)
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive, action: {
                    withAnimation {
                        dataService.removeItem(id: item.id)
                    }
                }) {
                    Label("Delete", systemImage: "trash")
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityHint("Swipe left to delete")
        }
    }
    
    // MARK: - Binding Helper
    private func binding(for item: Item) -> Binding<Item>? {
        guard let index = dataService.items.firstIndex(where: { $0.id == item.id }) else {
            return nil
        }
        return $dataService.items[index]
    }
    
    // MARK: - UI Components
    private var filterButton: some View {
        Button(action: { showingFilters.toggle() }) {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .symbolVariant(selectedFilter == .favorites ? .fill : .none)
                .foregroundColor(selectedFilter == .favorites ? .yellow : Palette.primary)
                .accessibilityLabel("Filter options")
        }
    }
    
    private var addButton: some View {
        Button(action: {
            withAnimation {
                dataService.addItem()
            }
        }) {
            Image(systemName: "plus")
                .accessibilityLabel("Add new block")
        }
        .disabled(selectedFilter == .favorites) // Disable when in Favorites Only filter
        .opacity(selectedFilter == .favorites ? 0.4 : 1.0) // Dim the button when disabled for visual feedback
    }

    private var filterHeader: some View {
        HStack {
            Text("ITEMS")
                .font(.caption)
                .foregroundColor(.secondary)
                .accessibilityHidden(true)
            
            Spacer()
            
            Text(selectedFilter.rawValue)
                .font(.caption.weight(.semibold))
                .foregroundColor(Palette.primary)
                .accessibilityLabel("Current filter: \(selectedFilter.rawValue)")
        }
        .padding(.vertical, 8)
        .accessibilityElement(children: .combine)
    }
    
    private var emptyStateView: some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                Image(systemName: "star")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                Text("No favorites yet")
                    .font(.body)
                    .foregroundColor(.secondary)
                Text("Mark items as favorites to see them here.")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 32)
            Spacer()
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("No favorites yet. Mark items as favorites to see them here.")
    }
    
    private var filterView: some View {
        NavigationStack {
            List(FilterOption.allCases, id: \.self) { option in
                Button(action: {
                    selectedFilter = option
                    showingFilters = false
                }) {
                    HStack {
                        Text(option.rawValue)
                        Spacer()
                        if selectedFilter == option {
                            Image(systemName: "checkmark")
                                .foregroundColor(Palette.primary)
                        }
                    }
                }
                .accessibilityElement(children: .combine)
            }
            .navigationTitle("Filter Options")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { showingFilters = false }
                }
            }
        }
    }
}

// Preview Provider
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
