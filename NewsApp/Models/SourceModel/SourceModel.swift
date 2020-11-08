//
//  SourceModel.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//

import Foundation
// MARK: - Source
struct SourceModel: Codable {
    let id, name, sourceDescription: String
    let url: String
    let category: CategoryModel
    let language, country: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case sourceDescription = "description"
        case url, category, language, country
    }
}

enum CategoryModel: String, Codable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}
