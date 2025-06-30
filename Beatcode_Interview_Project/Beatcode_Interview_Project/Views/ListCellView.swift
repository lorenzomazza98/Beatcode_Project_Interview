//
//  ListCellView.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

struct ListCellView:  View {
    @Binding var item: Item
    var body: some View {
        HStack{
            Text(item.title)
            Spacer()
            Button(action: { item.isFavourite.toggle() }) {
                Image(systemName: item.isFavourite ? "star.fill" : "star")
                    .foregroundColor(item.isFavourite ? .yellow : .gray)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(item.title), \(item.isFavourite ? "favorited" : "not favorited")")
            .accessibilityAddTraits(.isButton)
            .accessibilityAction(named: "Toggle favorite") {
                item.isFavourite.toggle()
            }
            .buttonStyle(.borderless)
        }
        .padding(12)
        .background(item.isFavourite ? Color.yellow.opacity(0.1) : Color.clear)
        .cornerRadius(8)
    }
}
