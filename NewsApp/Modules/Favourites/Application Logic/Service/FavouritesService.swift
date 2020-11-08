//
//  FavouritesService.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation

class FavouritesService: FavouritesServiceType {

    // MARK: Properties
    var storage: Storage?
    // MARK: Initialization

    // MARK: Data management
    init() {
        self.storage = UserDefaultStorage(articles: [])
    }

    func getSavedArticles() -> [Article] {
        return self.storage?.load() ?? []
    }
}
