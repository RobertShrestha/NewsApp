//
//  ArticleInteractor.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation

class ArticleInteractor {

	// MARK: Properties

    weak var output: ArticleInteractorOutput?
    private let service: ArticleServiceType

    // MARK: Initialization

    init(service: ArticleServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Article interactor input interface

extension ArticleInteractor: ArticleInteractorInput {
}
