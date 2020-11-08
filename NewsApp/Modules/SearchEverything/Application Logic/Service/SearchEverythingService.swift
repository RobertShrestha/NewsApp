//
//  SearchEverythingService.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxSwift
class SearchEverythingService: SearchEverythingServiceType {

    // MARK: Properties

    // MARK: Initialization

    // MARK: Data management

    func getArticles<T: Codable>(resource: Resource<BaseArticleResponse<T>>) -> Single<BaseArticleResponse<T>>{
        return WebServices.shared.load(resource: resource, withToken: false)
    }
}
