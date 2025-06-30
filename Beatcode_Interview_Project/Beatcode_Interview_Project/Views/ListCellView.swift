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
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 16) {
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
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(item.isFavourite ? "Favorited" : "Not favorited")
            .accessibilityValue(item.title)
            .accessibilityHint("Double tap to toggle favorite status")
            .buttonStyle(.plain)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(
                    colorScheme == .dark
                        ? Color(uiColor: .secondarySystemBackground)
                        : Color.white
                )
                .shadow(
                    color: colorScheme == .dark
                        ? Color.black.opacity(0.35)
                        : Color.gray.opacity(0.18),
                    radius: 10, x: 0, y: 4
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(
                    colorScheme == .dark
                        ? Color.white.opacity(0.08)
                        : Color.black.opacity(0.08),
                    lineWidth: 1
                )
        )
        .padding(.vertical, 2)
    }
}

