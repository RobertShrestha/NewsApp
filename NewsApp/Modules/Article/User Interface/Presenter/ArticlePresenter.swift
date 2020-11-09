//
//  ArticlePresenter.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxCocoa
import RxSwift
class ArticlePresenter {
    var storageClient = StorageClient(storage: UserDefaultStorage(articles: []))
	// MARK: Properties
    weak var view: ArticleViewInterface?
    var interactor: ArticleInteractorInput?
    var wireframe: ArticleWireframeInput?
    var selectedArticle : Article
    var article = BehaviorRelay<Article?>(value: nil)
    var continueButtonTapped = PublishSubject<Void>()
    var shareButtonTapped = PublishSubject<Void>()
    var saveButtonTapped = PublishSubject<Void>()
    var disposeBag = DisposeBag()
    // MARK: Converting entities
    init(with article: Article) {
        self.selectedArticle = article
        self.article.accept(selectedArticle)
        subscribedEvents()
//        storage = UserDefaultStorage(articles: [])
    }
}

 // MARK: Article module interface

extension ArticlePresenter: ArticleModuleInterface {
    private func subscribedEvents() {
        self.shareButtonTapped
            .asObserver()
            .subscribe(onNext: { [self] in
            log.info("Tapped")
            self.handleShare()
        }).disposed(by: disposeBag)
        self.continueButtonTapped
            .asObserver()
            .subscribe(onNext: { [self] in
                log.info("Continue")
                toBrowser()
            }).disposed(by: disposeBag)
        self.saveButtonTapped
            .asObserver()
            .subscribe(onNext: { [self] in
                self.storageClient.addArticle(with: selectedArticle)
            }).disposed(by: disposeBag)
    }
    private func toBrowser() {
        if let url = URL(string: selectedArticle.url) {
            UIApplication.shared.open(url)
        }
    }
    private func handleShare() {
        if let link = NSURL(string: self.selectedArticle.url) {
            let objectsToShare = [self.selectedArticle.title,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

            activityVC.excludedActivityTypes = [
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.addToReadingList
            ]
            self.view?.presentActivity(activityVC: activityVC)
        }
    }





}

// MARK: Article interactor output interface

extension ArticlePresenter: ArticleInteractorOutput {
}
