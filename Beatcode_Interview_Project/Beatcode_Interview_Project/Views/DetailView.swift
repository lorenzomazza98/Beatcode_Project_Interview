//
//  DetailView.swift
//  Beatcode_Interview_Project
//
//  Created by Lorenzo Mazza on 30/06/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var item: Item
    @Environment(\.dismiss) private var dismiss
    let currentFilter: ListView.FilterOption

    var body: some View {
        VStack(spacing: 32) {
            // Hero Card
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            item.color.opacity(0.65),
                            Palette.background.opacity(0.5)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 120)
                .overlay(
                    HStack(spacing: 18) {
                        ZStack {
                            Circle()
                                .fill(Palette.primary)
                                .frame(width: 44, height: 44)
                            Image(systemName: "star.fill")
                                .foregroundColor(item.isFavourite ? .yellow : .white.opacity(0.5))
                                .font(.title2)
                                .opacity(item.isFavourite ? 1.0 : 0.4)
                        }
                        .accessibilityHidden(true)
                        VStack(alignment: .leading, spacing: 6) {
                            Text(item.title)
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                            Text(item.isFavourite ? "Favorited" : "Not Favorited")
                                .font(.caption)
                                .foregroundColor(item.isFavourite ? .yellow : .secondary)
                                .accessibilityLabel(item.isFavourite ? "Favorited" : "Not favorited")
                        }
                        Spacer()
                        favoriteButton
                    }
                    .padding(.horizontal, 24)
                )
                .padding(.horizontal, 16)
                .padding(.top, 16)

            // Details Card
            VStack(alignment: .leading, spacing: 16) {
                Text("Item Details")
                    .font(.headline)
                Text("This is a detailed description for \(item.title). The content would normally contain specific information about this item.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding(24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor.secondarySystemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 6)
            )
            .padding(.horizontal, 16)

            Spacer()
        }
        .background(
            LinearGradient(
                colors: [item.color.opacity(0.18), Color.black],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(false)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var favoriteButton: some View {
        Button(action: {
            withAnimation {
                let wasFavorite = item.isFavourite
                item.isFavourite.toggle()
                if wasFavorite && currentFilter == .favorites {
                    dismiss()
                }
            }
        }) {
            Image(systemName: item.isFavourite ? "star.fill" : "star")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(item.isFavourite ? .yellow : .secondary)
                .symbolEffect(.bounce, value: item.isFavourite)
                .padding(10)
                .background(
                    Circle()
                        .fill(Color.black.opacity(0.08))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Circle())
        .accessibilityLabel("Toggle favourite")
    }
}

