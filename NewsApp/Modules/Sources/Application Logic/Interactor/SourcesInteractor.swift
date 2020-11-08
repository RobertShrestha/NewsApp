//
//  SourcesInteractor.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation

class SourcesInteractor {

	// MARK: Properties

    weak var output: SourcesInteractorOutput?
    private let service: SourcesServiceType

    // MARK: Initialization

    init(service: SourcesServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Sources interactor input interface

extension SourcesInteractor: SourcesInteractorInput {
    func getSources(pageCount: Int, category: Category) {
        let selectedCountry = UserDefaultsConstants.selectedCountry.decoded() as CountryModel
        guard let url = URLBuilder()
                .setPath(paths: .sources)
                .addCountry(withCountryCode: selectedCountry.code.lowercased())
                .addCategory(with: category.rawValue)
                .addPageSize(withSize: Constants.perPage)
                .addPageCount(withPage: pageCount)
                .addAPIKey()
                .build() else { return }
        var resource = Resource<BaseSourceResponse<[SourceModel]>>(url: url)
        resource.httpMethod = .get
        self.output?.successGettingHeadlines(response: self.service.getSources(resource: resource))
    }

}
