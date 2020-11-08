//
//  SearchEverythingInteractorIO.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//
import RxSwift
protocol SearchEverythingInteractorInput: class {
    func getArticles(pageCount: Int,query: String)
}

protocol SearchEverythingInteractorOutput: class {
    func successGettingHeadlines(response: Single<BaseArticleResponse<[Article]>>)
}
