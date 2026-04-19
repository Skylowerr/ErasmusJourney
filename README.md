# ErasmusJourney 🗺️

A SwiftUI iOS app that lets Erasmus students pin visited locations on a map and write personal notes about each place.

---

## Features

- 📍 Pin locations on an interactive map using MapKit
- 📝 Write and save personal notes for each location
- 🗂️ Browse all pinned locations in a list view
- 🔍 View location details with annotations

---

## Data

Location data is currently provided via a **mock data service** (`LocationsDataService.swift`). Personal notes are stored locally using mock data — no backend or internet connection required. This approach keeps the app lightweight and fully offline, while making it easy to swap in a real backend like Firebase or CoreData in the future.

---

## Tech Stack

- **SwiftUI** — declarative, reactive UI framework
- **MapKit** — interactive map with custom annotations and location previews
- **MVVM Architecture** — separates business logic from UI for cleaner, testable code
- **Mock Data Service** — simulates a data layer without requiring a backend

---

## Requirements

- iOS 16+
- Swift 5.9+
- Xcode 15+

---

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/Skylowerr/ErasmusJourney.git
```
2. Open the project in Xcode
3. Select a simulator (e.g. iPhone 15 Pro)
4. Press ⌘R to build and run

No API keys or external dependencies required. The app runs fully on-device with mock data.

---

## What I Learned

- 🗺️ **MapKit integration** — adding custom annotations, previews, and handling map interactions in SwiftUI
- 🏗️ **MVVM pattern** — structuring a real project with a clean separation between View, ViewModel, and Model
- 📦 **Data service layer** — abstracting data access behind a service class for modularity
- 🔗 **State management** — using `@StateObject` and `@Published` to keep UI in sync with data

---

## About

Built during Erasmus exchange in Czech Republic 🇨🇿
Inspired by the desire to document and remember every place visited during the exchange experience.
