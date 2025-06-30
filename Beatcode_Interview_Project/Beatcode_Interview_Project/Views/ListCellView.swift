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
    
    private var badge: some View {
        ZStack {
            Circle()
                .fill(Palette.primary)
                .frame(width: 28, height: 28)
            Text("\(index + 1)")
                .foregroundColor(.white)
                .font(.caption.bold())
        }
        .accessibilityHidden(true)
    }

    private var favoriteButton: some View {
        Button(action: {
            withAnimation(.spring(duration: 0.3)) {
                item.isFavourite.toggle()
            }
        }) {
            Image(systemName: item.isFavourite ? "star.fill" : "star")
                .symbolEffect(.bounce, value: item.isFavourite)
                .font(.title3)
                .foregroundColor(item.isFavourite ? .yellow : .secondary)
                .contentTransition(.symbolEffect(.replace))
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(item.isFavourite ? "Favorited" : "Not favorited")
        .accessibilityValue(item.title)
        .accessibilityHint("Double tap to toggle favorite status")
        .buttonStyle(.plain)
    }
    
    var body: some View {
        HStack(spacing: 16) {
            badge
            
            Text(item.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            favoriteButton
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.tertiarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(item.isFavourite ? Color.yellow : Color.clear, lineWidth: 2)
        )
    }
}

