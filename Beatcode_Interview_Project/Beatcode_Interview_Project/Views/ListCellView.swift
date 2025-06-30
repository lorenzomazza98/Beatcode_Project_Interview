//
//  ListCellView.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

struct ListCellView: View {
    @Binding var item: Item
    let index: Int
    
    var body: some View {
        HStack(spacing: 16) {
            // Modern badge with index
            ZStack {
                Circle()
                    .fill(Palette.primary)
                    .frame(width: 28, height: 28)
                Text("\(index + 1)")
                    .foregroundColor(.white)
                    .font(.caption.bold())
            }
            .accessibilityHidden(true)
            
            Text(item.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            // Animated favorite button
            Button(action: {
                withAnimation(.spring(duration: 0.3)) {
                    item.isFavorite.toggle()
                }
            }) {
                Image(systemName: item.isFavorite ? "star.fill" : "star")
                    .symbolEffect(.bounce, value: item.isFavorite)
                    .font(.title3)
                    .foregroundColor(item.isFavorite ? .yellow : .secondary)
                    .contentTransition(.symbolEffect(.replace))
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(item.isFavorite ? "Favorited" : "Not favorited")
            .accessibilityValue(item.title)
            .accessibilityHint("Double tap to toggle favorite status")
            .buttonStyle(.plain)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.tertiarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(item.isFavorite ? Color.yellow : Color.clear, lineWidth: 2)
        )
    }
}
