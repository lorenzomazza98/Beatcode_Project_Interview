//
//  DataService.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import Foundation
import Combine

class DataService: ObservableObject {
    @Published var items: [Item] = []
    private var nextIndex = 0
    
    init() {
        // Initialize with 1 item
        addItem()
    }
    
    func addItem() {
        let newItem = Item(
            title: "Cell number \(items.count + 1)",
            isFavourite: false,
            index: nextIndex
        )
        items.append(newItem)
        nextIndex += 1
    }
    
    func removeItem(id: UUID) {
        items.removeAll { $0.id == id }
    }
}
