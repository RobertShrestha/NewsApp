//
//  HeadlineInteractorIO.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//
import RxSwift
protocol HeadlineInteractorInput: class {
    func getHeadlines(pageCount: Int,category: Category)
}

protocol HeadlineInteractorOutput: class {
    func successGettingHeadlines(response: Single<BaseArticleResponse<[Article]>>)
}
