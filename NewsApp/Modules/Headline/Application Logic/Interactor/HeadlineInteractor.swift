//
//  HeadlineInteractor.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import Foundation

class HeadlineInteractor {

	// MARK: Properties

    weak var output: HeadlineInteractorOutput?
    private let service: HeadlineServiceType

    // MARK: Initialization

    init(service: HeadlineServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Headline interactor input interface

extension HeadlineInteractor: HeadlineInteractorInput {
    func getHeadlines(pageCount: Int,category: Category) {
        let selectedCountry = UserDefaultsConstants.selectedCountry.decoded() as CountryModel
        guard let url = URLBuilder()
                .setPath(paths: .headline)
                .addCountry(withCountryCode: selectedCountry.code.lowercased())
                .addCategory(with: category.rawValue)
                .addPageSize(withSize: Constants.perPage)
                .addPageCount(withPage: pageCount)
                .addAPIKey()
                .build() else { return }
        var resource = Resource<BaseArticleResponse<[Article]>>(url: url)
        resource.httpMethod = .get
        self.output?.successGettingHeadlines(response: self.service.getArticles(resource: resource))
    }
    
}
