//
//  CountrySelectionInteractorIO.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//
import RxSwift
protocol CountrySelectionInteractorInput: class {
    func getCountries()
}

protocol CountrySelectionInteractorOutput: class {
    func successGettingCountries(response: Single<[CountryModel]>)
}
