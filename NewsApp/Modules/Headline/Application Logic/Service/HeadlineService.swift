//
//  HeadlineService.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import Foundation
import RxSwift
class HeadlineService: HeadlineServiceType {
    func getArticles<T: Codable>(resource: Resource<BaseArticleResponse<T>>) -> Single<BaseArticleResponse<T>> {
        return WebServices.shared.load(resource: resource, withToken: false)
    }
    

    // MARK: Properties

    // MARK: Initialization

    // MARK: Data management
}
