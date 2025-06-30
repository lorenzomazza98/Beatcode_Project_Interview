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
            Button(action: { item.isFavourite.toggle()}) {
                Image(systemName: item.isFavourite ? "star.fill" : "star")
                    .foregroundColor(item.isFavourite ? .yellow : .gray)
            }
            .buttonStyle(.borderless)
        }
        .padding(12)
    }
}
