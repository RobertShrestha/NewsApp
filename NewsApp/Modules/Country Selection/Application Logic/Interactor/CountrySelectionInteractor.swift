//
//  CountrySelectionInteractor.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import Foundation
import RxSwift
class CountrySelectionInteractor {

	// MARK: Properties

    weak var output: CountrySelectionInteractorOutput?
    private let service: CountrySelectionServiceType

    // MARK: Initialization

    init(service: CountrySelectionServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: CountrySelection interactor input interface

extension CountrySelectionInteractor: CountrySelectionInteractorInput {
    func getCountries() {
            let countries = CountryHelper.shared.getCountries()
            self.output?.successGettingCountries(response: countries)
    }

}
