//
//  SourcesServiceType.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation
import RxSwift
protocol SourcesServiceType: class {
    func getSources<T: Codable>(resource: Resource<BaseSourceResponse<T>>) -> Single<BaseSourceResponse<T>>

}
