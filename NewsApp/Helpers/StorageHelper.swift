//
//  StorageHelper.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//

import Foundation

protocol Storage {
    var articles: [Article] {get set}
    func load() -> [Article]
    mutating func remove(article: Article)
    mutating func save(article:Article)
}

struct UserDefaultStorage: Storage {

    var articles: [Article]

    
    func load() -> [Article] {
        let savedArticle = UserDefaultsConstants.savedArticles.decoded() as [Article]
        return savedArticle
    }

    mutating func remove(article: Article) {
        let savedArticle = UserDefaultsConstants.savedArticles.decoded() as [Article]
        let filteredArticle = savedArticle.filter({$0 != article})
        UserDefaultsConstants.savedArticles = filteredArticle.toData()
    }

    mutating func save(article: Article) {

        if UserDefaultsConstants.savedArticles == Data() {
            articles = []
        }else {
            articles = UserDefaultsConstants.savedArticles.decoded() as [Article]
        }
        articles.append(article)
        UserDefaultsConstants.savedArticles = articles.toData()
    }


}

struct StorageClient {
    var storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }

    func loadArticles() -> [Article] {
        return storage.load()
    }
    mutating func addArticle(with article: Article) {
        return storage.save(article: article)
    }
    mutating func removeArticle(with article: Article) {
        return storage.remove(article: article)
    }
}
