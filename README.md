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

## What to Test
	- List View
	•	Verify that each cell displays a unique title and a distinct background color.
	•	Tap the star icon to toggle favorite status; the star should animate and change color immediately.
	•	Swipe left on a cell to reveal and use the delete action.
	•	Tap a cell (excluding the star) to open the detail view.
	•	Adding new items is disabled when the “Favorites Only” filter is active.
	•	Use the filter button to switch between “All Items” and “Favorites Only.” The list updates accordingly.
	•	When in “Favorites Only,” the empty state message appears if no favorites exist.
 
	- Detail View
	•	Confirm the title and favorite status match the selected item.
	•	Tap the star icon to toggle favorite status; the icon animates and updates immediately.
	•	When unfavoriting an item in the “Favorites Only” filter, the detail view dismisses automatically, and the item disappears from the list.
	•	The detail view uses a modern card design with a gradient background matching the item’s color.
	•	Navigation back returns to the list view without unexpected behavior.
 
	-	Accessibility
	•	VoiceOver reads all interactive elements with appropriate labels and hints.
	•	Swipe actions and buttons are accessible and announce their purpose clearly.
	•	Tap targets are well-defined and do not interfere with navigation gestures.
 
	- General
	•	The app runs in dark mode consistently.
	•	Animations are smooth and visually appealing.
	•	The UI adapts well to different device sizes and orientations.
