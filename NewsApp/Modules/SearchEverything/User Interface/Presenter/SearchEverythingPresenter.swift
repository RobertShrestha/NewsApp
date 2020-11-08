//
//  SearchEverythingPresenter.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxSwift
import RxCocoa
class SearchEverythingPresenter {

	// MARK: Properties
    weak var view: SearchEverythingViewInterface?
    var interactor: SearchEverythingInteractorInput?
    var wireframe: SearchEverythingWireframeInput?
    var disposeBag = DisposeBag()
    // MARK: Converting entities

    var articles = BehaviorRelay<[Article]>(value:[])

    var query = BehaviorRelay<String>(value:"Trump")

    var selectedArticle = PublishSubject<IndexPath> ()
    init() {
        self.subscribe()
    }
}

 // MARK: SearchEverything module interface

extension SearchEverythingPresenter: SearchEverythingModuleInterface {
    func getArticles(query:String) {
        DispatchQueue.main.async {
            self.interactor?.getArticles(pageCount: 1, query: query)
        }
    }

    func subscribe() {
        self.query
            .asObservable()
            .subscribe(onNext: {
                if $0.count > 3 {
                    self.getArticles(query: $0)
                }
        }).disposed(by: disposeBag)
        self.selectedArticle
            .asObserver()
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let selectedArticle = self.articles.value[safe: indexPath.row] {
                    self.wireframe?.goToArticle(withArticle: selectedArticle, view: self.view)
                }

            }).disposed(by: disposeBag)
    }



}

// MARK: SearchEverything interactor output interface

extension SearchEverythingPresenter: SearchEverythingInteractorOutput {
        func successGettingHeadlines(response: Single<BaseArticleResponse<[Article]>>) {
            view?.showProgressHud()
            _ = response.subscribe(onSuccess: { (response) in
                switch response.status == "ok" {
                case true:
                    self.articles.accept(response.articles ?? [])
                case false:
                    self.view?.alert(message: response.message, title: nil, okAction: nil)
                }
                self.view?.hideProgressHud()
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
