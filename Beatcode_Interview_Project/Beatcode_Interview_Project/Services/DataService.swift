//
//  DataService.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import Foundation
import Combine

class DataService: ObservableObject {
    @Published var items : [Item] = [
        Item(title: "Cell number 1", isFavourite: false),
        Item(title: "Cell number 2", isFavourite: false),
        Item(title: "Cell number 3", isFavourite: false)
    ]
    
    func toggleFavourite(for id: UUID){
        if let index = items.firstIndex(where: {$0.id == id}) {
            items[index].isFavourite.toggle()
        }
    }
    
    func addItem() {
        let newIndex = items.count + 1
        items.append(Item(title: "Cell number \(newIndex)", isFavourite: false))
    }
    
    func removeItem(id: UUID) {
        items.removeAll { $0.id == id }
    }
}
