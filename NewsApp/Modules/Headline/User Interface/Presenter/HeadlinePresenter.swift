//
//  HeadlinePresenter.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import Foundation
import RxSwift
import RxCocoa
class HeadlinePresenter {

	// MARK: Properties
    weak var view: HeadlineViewInterface?
    var interactor: HeadlineInteractorInput?
    var wireframe: HeadlineWireframeInput?
    var disposeBag = DisposeBag()
    // MARK: Converting entities
    var articles = BehaviorRelay<[Article]>(value: [])
    var selectedArticle = PublishSubject<IndexPath>()
    var selectCountryTapped = PublishSubject<Void>()
    init() {
        //self.getArticles()
        self.subscribe()
    }
}

 // MARK: Headline module interface

extension HeadlinePresenter: HeadlineModuleInterface {
    func getArticles(category:Category) {
        DispatchQueue.main.async {
            self.interactor?.getHeadlines(pageCount: 1, category: category)
        }

    }
    private func subscribe() {
        self.selectedArticle
            .asObserver()
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                if let selectedArticle = self.articles.value[safe: indexPath.row] {
                    self.wireframe?.goToArticle(withArticle: selectedArticle, view: self.view)
                }

            }).disposed(by: disposeBag)
        self.selectCountryTapped
            .asObserver()
            .subscribe(onNext: {
                self.wireframe?.goToSelectCountry(view: self.view!)
            }).disposed(by: disposeBag)
    }


}

// MARK: Headline interactor output interface

extension HeadlinePresenter: HeadlineInteractorOutput {
    func successGettingHeadlines(response: Single<BaseArticleResponse<[Article]>>) {
        view?.showProgressHud()
        _ = response.subscribe(onSuccess: { (response) in
            switch response.status == "ok" {
            case true:
                self.articles.accept(response.articles ?? [])
//                if !self.isPagination {
//                    self.notifications.removeAll()
//                }
//                self.notifications.append(contentsOf: response.data?.dataList ?? [])
//                if response.data?.unseenItems ?? 0 > 0 {
//                    self.interactor?.setNotificationToSeen()
//                }
//                self.dataEnded = self.notifications.value.count >= response.data?.totalItems ?? 0
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
