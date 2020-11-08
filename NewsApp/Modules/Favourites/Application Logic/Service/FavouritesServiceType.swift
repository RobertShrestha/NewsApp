//
//  FavouritesServiceType.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation

protocol FavouritesServiceType: class {
    func getSavedArticles() -> [Article]
}
