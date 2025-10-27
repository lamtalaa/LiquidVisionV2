
# LiquidVision

## Overview
LiquidVision is a SwiftUI iOS application that classifies images with Core ML and instantly evaluates the sentiment of the predicted label using Apple’s Natural Language framework. A dedicated root tab view works alongside lightweight coordinators to keep UI, state, and navigation responsibilities clearly separated.

## Tech Stack
- Swift 5.10
- SwiftUI & PhotosUI
- Core ML (MobileNetV2)
- Apple Natural Language (NLTagger + Sentiment)
- Vision (VNCoreMLRequest)
- XCTest

## Architecture
LiquidVision follows an MVVM flow supported by slim coordinators:
- **Model / Services**: `ImageClassificationServicing` and `SentimentAnalysisServicing` encapsulate ML and NLP work.
- **ViewModel**: `ClassificationViewModel` and `SentimentViewModel` expose a single `ViewState` value so async updates stay consistent and Combine noise is minimized.
- **View**: SwiftUI views render that state, own the presentation concerns (camera sheets, pickers), and bind through key-path helpers for clarity.
- **Coordinator**: `AppCoordinator`, `ClassificationCoordinator`, and `SentimentCoordinator` now focus purely on dependency wiring while `LiquidVisionRootView` owns the tab layout.

This separation keeps business logic testable, avoids constructing views inside coordinators, and aligns with the Core ML feedback on SRP.

## Project Structure
```
LiquidVision/
├── Coordinators/
│   ├── AppCoordinator.swift
│   ├── ClassificationCoordinator.swift
│   └── SentimentCoordinator.swift
├── Services/
│   ├── ImageClassificationService.swift
│   └── SentimentAnalysisService.swift
├── ViewModels/
│   ├── ClassificationViewModel.swift
│   └── Sentiment/
│       └── SentimentViewModel.swift
├── Views/
│   ├── Classification/
│   │   └── ClassificationView.swift
│   ├── Root/
│   │   └── LiquidVisionRootView.swift
│   ├── Sentiment/
│   │   └── SentimentView.swift
│   └── Shared/
│       └── CameraView.swift
├── LiquidVisionApp.swift
└── Assets, ML model, and supporting files
```

Unit and UI tests live under `LiquidVisionTests/` and `LiquidVisionUITests/`.

## Features
- **Image Classification**: Pick or capture a photo and run MobileNetV2 inference with Vision + Core ML.
- **Sentiment Insight**: Analyze the predicted label’s sentiment asynchronously and surface score + polarity.
- **Camera Support**: SwiftUI-friendly `CameraView` wrapper for `UIImagePickerController`.
- **Theming**: Gradient-backed, glassmorphism-inspired UI shared across features.
- **Root Tab Navigation**: Tab-based experience hosted in `LiquidVisionRootView` with coordinators limited to wiring dependencies.

## Example Usage
1. Launch LiquidVision on an iOS 16+ device or simulator.
2. Select **Vision** tab (default) and tap **Choose Photo** to pick from the library or **Capture Photo** to use the camera.
3. After the image is classified, review the predicted label, confidence, and sentiment summary for that prediction.
4. Switch to the **Sentiment** tab to manually enter text and analyze its polarity using the Natural Language framework.

## Testing
All critical layers are covered with XCTest:

```bash
xcodebuild test \
  -scheme LiquidVision \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro' \
  -enableCodeCoverage YES
```

Unit tests validate view-model behaviors, service error handling, and async flows; UI tests are currently skipped while the interface evolves. Review the generated coverage report in Xcode’s Report navigator to ensure the project stays above the 60% target.
