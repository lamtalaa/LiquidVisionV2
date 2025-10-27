//
//  AppCoordinator.swift
//  LiquidVision
//
//  Created by Yassine Lamtalaa on 10/21/25.
//
import Foundation

final class AppCoordinator: ObservableObject {
    private let classificationCoordinator: ClassificationCoordinator
    private let sentimentCoordinator: SentimentCoordinator

    lazy var classificationViewModel: ClassificationViewModel = {
        classificationCoordinator.makeViewModel()
    }()

    lazy var sentimentViewModel: SentimentViewModel = {
        sentimentCoordinator.makeViewModel()
    }()

    init(
        classificationCoordinator: ClassificationCoordinator? = nil,
        sentimentCoordinator: SentimentCoordinator? = nil
    ) {
        self.classificationCoordinator = classificationCoordinator ?? ClassificationCoordinator()
        self.sentimentCoordinator = sentimentCoordinator ?? SentimentCoordinator()
    }
}
