//
//  SearchEverythingInteractor.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation

class SearchEverythingInteractor {

	// MARK: Properties

    weak var output: SearchEverythingInteractorOutput?
    private let service: SearchEverythingServiceType

    // MARK: Initialization

    init(service: SearchEverythingServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: SearchEverything interactor input interface

extension SearchEverythingInteractor: SearchEverythingInteractorInput {
    func getArticles(pageCount: Int, query: String) {
        guard let url = URLBuilder()
                .setPath(paths: .everything)
                .addQuery(with: query)
                .addPageSize(withSize: Constants.perPage)
                .addPageCount(withPage: pageCount)
                .addAPIKey()
                .build() else { return }
        var resource = Resource<BaseArticleResponse<[Article]>>(url: url)
        resource.httpMethod = .get
        self.output?.successGettingHeadlines(response: self.service.getArticles(resource: resource))
    }
    
}
