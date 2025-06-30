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
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Featured Items")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
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
        // Safely get binding to the original item
        if let binding = binding(for: item) {
            NavigationLink(destination: DetailView(item: binding)) {
                ListCellView(item: binding)
                    .contentShape(Rectangle())
                    .modernGradient()
            }
            .swipeActions(edge: .trailing) {
                Button(action: { binding.wrappedValue.isFavourite.toggle() }) {
                    Label("Favorite", systemImage: "star")
                }
                .tint(.yellow)
            }
            .listRowBackground(Palette.rowBackground(index: index))
            .listRowSeparatorTint(Palette.primary.opacity(0.3))
            .accessibilityElement(children: .combine)
            .accessibilityHint("Swipe right for actions")
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
                .symbolVariant(selectedFilter == .all ? .none : .fill)
                .accessibilityLabel("Filter options")
        }
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

