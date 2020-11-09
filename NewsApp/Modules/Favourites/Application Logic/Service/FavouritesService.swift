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
    var storageClient = StorageClient(storage: UserDefaultStorage(articles: []))
    // MARK: Initialization

    // MARK: Data management
    func getSavedArticles() -> [Article] {
        return self.storageClient.loadArticles()
    }
}
