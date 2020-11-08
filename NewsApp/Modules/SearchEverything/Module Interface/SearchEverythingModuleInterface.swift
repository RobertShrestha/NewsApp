//
//  SearchEverythingModuleInterface.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//
import RxSwift
import RxCocoa
protocol SearchEverythingModuleInterface: class {
    func getArticles(query:String)
    var articles: BehaviorRelay<[Article]> {get}
    var query: BehaviorRelay<String> {get}
    var selectedArticle: PublishSubject<IndexPath> {get}
}
