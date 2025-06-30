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
        VStack(spacing: 24) {
            HStack {
                // Title
                Text(item.title)
                    .font(.title.bold())
                    .foregroundColor(Palette.primary)
                    .frame(maxWidth: .infinity)
                
                // Favorite button
                favoriteButton
            }
            .padding(.horizontal, 24)
            
            Divider()
                .background(Palette.secondary)
            
            // Content card
            VStack {
                Text("Item Details")
                    .font(.headline)
                    .padding(.bottom, 8)
                
                Text("This is a detailed description for \(item.title).")
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
                colors: [item.color.opacity(0.2), Color.black],
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
                
                // Dismiss if unfavoriting in favorites filter
                if wasFavorite && currentFilter == .favorites {
                    dismiss()
                }
            }
        }) {
            Image(systemName: item.isFavourite ? "star.fill" : "star")
                .font(.title)
                .symbolEffect(.bounce, value: item.isFavourite)
                .foregroundColor(item.isFavourite ? .yellow : .secondary)
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())
        .accessibilityLabel("Toggle favourite")
    }
}

