//
//  LiquidVisionRootView.swift
//  LiquidVision
//
//  Created by Yassine Lamtalaa on 10/21/25.
//
import SwiftUI

struct LiquidVisionRootView: View {
    @StateObject private var classificationViewModel: ClassificationViewModel
    @StateObject private var sentimentViewModel: SentimentViewModel

    init(
        classificationViewModel: ClassificationViewModel,
        sentimentViewModel: SentimentViewModel
    ) {
        _classificationViewModel = StateObject(wrappedValue: classificationViewModel)
        _sentimentViewModel = StateObject(wrappedValue: sentimentViewModel)
    }

    var body: some View {
        TabView {
            ClassificationView(viewModel: classificationViewModel)
                .tabItem { Label("Vision", systemImage: "photo") }
                .tag(0)

            SentimentView(viewModel: sentimentViewModel)
                .tabItem { Label("Sentiment", systemImage: "text.quote") }
                .tag(1)
        }
    }
}
