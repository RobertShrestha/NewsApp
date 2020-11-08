//
//  HeadlineServiceType.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import Foundation
import RxSwift
protocol HeadlineServiceType: class {
    func getArticles<T: Codable>(resource: Resource<BaseArticleResponse<T>>) -> Single<BaseArticleResponse<T>>
}
