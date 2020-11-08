//
//  BaseResponse.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import Foundation
struct BaseArticleResponse<T: Codable>: Codable {
    var status: String
    var message: String?
    var totalResults: Int?
    var articles: T?
    private enum CodingKeys: String, CodingKey {
        case status
        case message
        case totalResults
        case articles
    }
}

struct BaseSourceResponse<T: Codable>: Codable {
    var status: String
    var message: String?
    var totalResults: Int?
    var sources: T?
    private enum CodingKeys: String, CodingKey {
        case status
        case message
        case totalResults
        case sources
    }
}
