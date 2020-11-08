//
//  SourcesModuleInterface.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//
import RxSwift
import RxCocoa
protocol SourcesModuleInterface: class {
    func getSources(category:Category)
    var sources: BehaviorRelay<[SourceModel]> {get}
    var selectedSource: PublishSubject<IndexPath> {get}
}
