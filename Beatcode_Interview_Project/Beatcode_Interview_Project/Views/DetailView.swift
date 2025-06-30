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
        VStack(spacing: 24) {
            // Remove custom close button and keep only the title and favorite button
            HStack {
                Spacer()
                Text(item.title)
                    .font(.title.bold())
                    .foregroundColor(Palette.primary)
                Spacer()
                // Favourite button with prominence
                Button(action: {
                    withAnimation {
                        item.isFavourite.toggle()
                    }
                }) {
                    Image(systemName: item.isFavourite ? "star.fill" : "star")
                        .font(.title)
                        .symbolEffect(.bounce, value: item.isFavourite)
                        .foregroundColor(item.isFavourite ? .yellow : .secondary)
                }
                .accessibilityLabel("Toggle favourite")
            }
            .padding(.horizontal, 24)

            Divider()
                .background(Palette.secondary)

            // Content card with depth
            VStack {
                Text("Item Details")
                    .font(.headline)
                    .padding(.bottom, 8)

                Text("This is a detailed description for \(item.title). The content would normally contain specific information about this item.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor.secondarySystemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal, 24)

            Spacer()
        }
        .padding(.top, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: [Palette.background, Color(UIColor.systemBackground)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(false) // Show default back button
        .navigationBarTitleDisplayMode(.inline) // Compact title in detail
    }
}

