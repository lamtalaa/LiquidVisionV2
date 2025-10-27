//
//  SentimentCoordinator.swift
//  LiquidVision
//
//  Created by Yassine Lamtalaa on 10/21/25.
//
import Foundation

final class SentimentCoordinator {
    private let service: SentimentAnalysisServicing

    init(service: SentimentAnalysisServicing = SentimentAnalysisService()) {
        self.service = service
    }

    func makeViewModel() -> SentimentViewModel {
        SentimentViewModel(service: service)
    }
}
