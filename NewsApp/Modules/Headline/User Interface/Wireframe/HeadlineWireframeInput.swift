//
//  HeadlineWireframeInput.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import Foundation

protocol HeadlineWireframeInput: WireframeInput {
    func goToArticle(withArticle article: Article, view: HeadlineViewInterface?)
    func goToSelectCountry(view: HeadlineViewInterface?)
}
