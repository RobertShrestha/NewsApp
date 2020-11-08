//
//  HeadlineModuleInterface.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//
import RxCocoa
import RxSwift
protocol HeadlineModuleInterface: class {
    func getArticles(category:Category)
    var articles: BehaviorRelay<[Article]> {get}
    var selectedArticle: PublishSubject<IndexPath> {get}
    var selectCountryTapped: PublishSubject<Void> {get}
}
