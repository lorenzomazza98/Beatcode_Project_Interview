//
//  DetailView.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var item: Item
    
    var body: some View {
        VStack{
            Text(item.title)
                .font(.title)
            ListCellView(item:$item)
                .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.systemBackground))
                .shadow(radius: 4)
        )
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
        .navigationTitle("Details")
    }
}
