//
//  FavouritesModuleInterface.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//
import RxCocoa
import RxSwift
protocol FavouritesModuleInterface: class {
    func getArticles()
    var articles: BehaviorRelay<[Article]> {get}
    var selectedArticle: PublishSubject<IndexPath> {get}
}
