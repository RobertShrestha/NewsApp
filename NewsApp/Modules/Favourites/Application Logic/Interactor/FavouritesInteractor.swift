//
//  FavouritesInteractor.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation

class FavouritesInteractor {

	// MARK: Properties

    weak var output: FavouritesInteractorOutput?
    private let service: FavouritesServiceType

    // MARK: Initialization

    init(service: FavouritesServiceType) {
        self.service = service
    }

    // MARK: Converting entities
}

// MARK: Favourites interactor input interface

extension FavouritesInteractor: FavouritesInteractorInput {
    func getSavedArticle() {
        self.output?.sucessGettingArticles(response: self.service.getSavedArticles()) 
    }
    
}
