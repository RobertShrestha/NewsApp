//
//  FavouritesInteractorIO.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

protocol FavouritesInteractorInput: class {

    func getSavedArticle()

}

protocol FavouritesInteractorOutput: class {
    func  sucessGettingArticles(response: [Article])
}
