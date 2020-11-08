//
//  SourcesService.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxSwift
class SourcesService: SourcesServiceType {

    // MARK: Properties

    // MARK: Initialization

    // MARK: Data management

    func getSources<T: Codable>(resource: Resource<BaseSourceResponse<T>>) -> Single<BaseSourceResponse<T>> {
        return WebServices.shared.load(resource: resource, withToken: false)
    }
}
