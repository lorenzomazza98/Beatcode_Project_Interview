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
            // Badge with cell number
            ZStack {
                Circle()
                    .fill(Palette.primary)
                    .frame(width: 28, height: 28)
                Text("\(index + 1)")
                    .foregroundColor(.white)
                    .font(.caption.bold())
            }
            .accessibilityHidden(true)

            // Title
            Text(item.title)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()

            // Favorite button (isolated from navigation)
            favoriteButton
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(item.color.opacity(0.3))
                .shadow(color: Color.black.opacity(0.22), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(item.isFavourite ? Color.yellow : Color.clear, lineWidth: 2)
        )
        .padding(.vertical, 2)
        .listRowBackground(Color.clear) // Ensures no default row background
        .listRowSeparator(.hidden) // Hides default separator
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
        }
        .buttonStyle(PlainButtonStyle()) // Prevents navigation trigger
        .contentShape(Rectangle()) // Ensures only button area is tappable
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(item.isFavourite ? "Favorited" : "Not favorited")
        .accessibilityValue(item.title)
        .accessibilityHint("Double tap to toggle favorite status")
    }
}
