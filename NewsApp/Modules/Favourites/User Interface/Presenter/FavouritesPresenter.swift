//
//  FavouritesPresenter.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxSwift
import RxCocoa
class FavouritesPresenter {

	// MARK: Properties
    weak var view: FavouritesViewInterface?
    var interactor: FavouritesInteractorInput?
    var wireframe: FavouritesWireframeInput?

    // MARK: Converting entities
    var articles = BehaviorRelay<[Article]>(value: [])

    var selectedArticle = PublishSubject<IndexPath>()
}

 // MARK: Favourites module interface

extension FavouritesPresenter: FavouritesModuleInterface {
    func getArticles() {
        self.interactor?.getSavedArticle()
    }



}
// MARK: Favourites interactor output interface
extension FavouritesPresenter: FavouritesInteractorOutput {
    func sucessGettingArticles(response: [Article]) {
        articles.accept(response)
    }

}
