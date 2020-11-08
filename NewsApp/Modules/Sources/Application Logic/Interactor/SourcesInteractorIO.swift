//
//  SourcesInteractorIO.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//
import RxSwift
protocol SourcesInteractorInput: class {
    func getSources(pageCount:Int, category: Category)
}

protocol SourcesInteractorOutput: class {
    func successGettingHeadlines(response: Single<BaseSourceResponse<[SourceModel]>>)
}
