
🚀 Just shipped something I’m really proud of!

**What I Built**  
LiquidVision – a SwiftUI iOS app that uses Core ML to classify photos and instantly gauges the sentiment of the predicted label with Apple’s Natural Language framework. The latest iteration embraces a dedicated root tab view with lightweight coordinators so navigation wiring stays clean while views own presentation.

**What I Learned**  
- Orchestrating Vision + Core ML asynchronously without blocking the main thread.  
- Taming NLTagger sentiment analysis (and its concurrency quirks) for fast, user-friendly feedback.  
- Why pushing view state into a single `ViewState` value—while letting coordinators focus on dependency injection—keeps SwiftUI codebases testable and reactive.

**Tools & Stack**  
SwiftUI • PhotosUI • CameraKit (UIKit bridge) • Core ML (MobileNetV2) • Vision • Natural Language • XCTest

**Visual Snippet**  
📸 Imagine a glassy SwiftUI card: snap a photo → see “Happy Dog” at 92% confidence → sentiment animates in as “Positive (0.78).” Flip to the Sentiment tab to demo text analysis live.

**Reflection**  
Pulling NLP and computer vision into one cohesive UX pushed me to think deeply about async state management. The biggest win? Keeping the pipeline testable—from ML inference to sentiment scoring—while maintaining that fluid “liquid glass” aesthetic.

**Bonus – Try It or Peek Under the Hood**  
👉 GitHub: https://github.com/lamtalaa/LiquidVisionV2
