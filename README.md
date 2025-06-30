Here’s a professional and well-organized README for your app:

# Beatcode Interview Project

## Overview
This SwiftUI app demonstrates a dynamic list of items with favorite toggling functionality, a detail view synchronized with the list, and a filter system to view all items or favorites only. The app features a modern UI with algorithmically generated colors for each cell, smooth animations, and comprehensive accessibility support.

## Features
- List of cells with unique titles and algorithmic colors
- Favorite toggle button on each cell and detail view
- Detail view synchronized with the list using @Binding
- Filter system to show all items or favorites only
- Swipe to delete items
- Add new items (disabled in favorites filter)
- Dark mode enforced for consistent UI
- Accessibility features including VoiceOver labels, hints, and action isolation

## Architecture
- MVVM pattern with a dedicated DataService managing the data
- Use of @StateObject and @Binding for state management and synchronization
- ColorGenerator for generating distinct colors for each cell

## UI/UX
- Modern card-style cells with shadows and rounded corners
- Animated favorite star icons with bounce effect
- Filter modal with clear visual indicators
- Empty state view for no favorites

## Accessibility
- VoiceOver labels and hints for all interactive elements
- Grouped accessibility elements to reduce verbosity
- Tap target isolation to prevent accidental navigation

## How to Build and Run
1. Clone the repository
2. Open `Beatcode_Interview_Project.xcodeproj` in Xcode 16 or later
3. Select an iOS 16+ simulator or device
4. Build and run the project (⌘+R)
