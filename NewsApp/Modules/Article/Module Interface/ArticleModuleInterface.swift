//
//  ArticleModuleInterface.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//
import RxCocoa
import RxSwift
protocol ArticleModuleInterface: class {
    var article: BehaviorRelay<Article?> {get}
    var continueButtonTapped: PublishSubject<Void> {get}
    var shareButtonTapped: PublishSubject<Void> {get}
    var saveButtonTapped: PublishSubject<Void> {get}
}
