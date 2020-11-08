//
//  CountrySelectionModuleInterface.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//
import RxCocoa
import RxSwift
protocol CountrySelectionModuleInterface: class {
    func getCountries()
    var countries: BehaviorRelay<[CountryModel]> {get}
    var countrySelected: PublishSubject<IndexPath> {get}
}
