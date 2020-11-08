//
//  HeadlineModel.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import Foundation
// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

extension Article: Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.title == rhs.title
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

public enum Category: String, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
}
