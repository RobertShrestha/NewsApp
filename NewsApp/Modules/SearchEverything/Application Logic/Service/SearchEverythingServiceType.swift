//
//  SearchEverythingServiceType.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxSwift
protocol SearchEverythingServiceType: class {
    func getArticles<T: Codable>(resource: Resource<BaseArticleResponse<T>>) -> Single<BaseArticleResponse<T>>
}
