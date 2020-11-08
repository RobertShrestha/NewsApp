//
//  CountrySelectionPresenter.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import Foundation
import RxSwift
import RxCocoa
class CountrySelectionPresenter {

	// MARK: Properties
    weak var view: CountrySelectionViewInterface?
    var interactor: CountrySelectionInteractorInput?
    var wireframe: CountrySelectionWireframeInput?
    var disposeBag = DisposeBag()
    var flow: CountrySelectionNavigations = .initial

    // MARK: Converting entities
    var countries = BehaviorRelay<[CountryModel]>(value: [])
    var countrySelected = PublishSubject<IndexPath> ()
    init(flow: CountrySelectionNavigations) {
        self.flow = flow
        subscribe()
    }

    private func subscribe() {
        self.countrySelected
            .asObserver()
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                let selectedCountry = self.countries.value[safe: indexPath.row]
                if let selectedCountryData = selectedCountry?.toData() {
                    UserDefaultsConstants.selectedCountry = selectedCountryData
                    log.debug("Selected country is saved", context: UserDefaultsConstants.selectedCountry.decoded() as CountryModel)
                }
                switch self.flow {
                case .initial:
                    self.wireframe?.goToMainTab(view: self.view)
                case .other:
                    self.view?.popVC()
                }

            }).disposed(by: disposeBag)
    }
}

 // MARK: CountrySelection module interface

extension CountrySelectionPresenter: CountrySelectionModuleInterface {

    func getCountries() {
        self.interactor?.getCountries()
    }
}

// MARK: CountrySelection interactor output interface

extension CountrySelectionPresenter: CountrySelectionInteractorOutput {
    func successGettingCountries(response: Single<[CountryModel]>) {
        _ = response.subscribe(onSuccess: { (countries) in
            self.countries.accept(countries.sorted(by: {$0.name < $1.name}))
        }, onError: {
            self.view?.hideProgressHud()
            let error = $0 as? APIErrors
            switch error {
            case .seralizationError(let error):
                self.view?.alert(message: error.localizedDescription, title: nil, okAction: nil)
            case .apiError(let message):
                self.view?.alert(message: message, title: nil, okAction: nil)
            case .domainError(let error):
                self.view?.alert(message: error.localizedDescription, title: nil, okAction: nil)
            case .none:
                log.error("APIErrors not found")
            }
        })
    }

}
