//
//  SourcesPresenter.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxSwift
import RxCocoa
class SourcesPresenter {

	// MARK: Properties
    weak var view: SourcesViewInterface?
    var interactor: SourcesInteractorInput?
    var wireframe: SourcesWireframeInput?
    var disposeBag = DisposeBag()

    var sources = BehaviorRelay<[SourceModel]>(value: [])

    var selectedSource = PublishSubject<IndexPath>()

    // MARK: Converting entities
    init() {
        makeSubscription()
    }
}

 // MARK: Sources module interface

extension SourcesPresenter: SourcesModuleInterface {
    func makeSubscription() {
        self.selectedSource.subscribe(onNext: { [self] in 
            let selectedSource = sources.value[$0.row]
            self.sendToBrowser(urlString: selectedSource.url)
        }).disposed(by: disposeBag)
    }
    func getSources(category: Category) {
        self.interactor?.getSources(pageCount: 1, category: .general)
    }
    func sendToBrowser(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: Sources interactor output interface

extension SourcesPresenter: SourcesInteractorOutput {
    func successGettingHeadlines(response: Single<BaseSourceResponse<[SourceModel]>>) {
        view?.showProgressHud()
        _ = response.subscribe(onSuccess: { (response) in
            switch response.status == "ok" {
            case true:
                self.sources.accept(response.sources ?? [])
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
