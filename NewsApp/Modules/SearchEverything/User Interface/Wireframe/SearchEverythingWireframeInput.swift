//
//  SearchEverythingWireframeInput.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import Foundation

protocol SearchEverythingWireframeInput: WireframeInput {
    func goToArticle(withArticle article: Article, view:  SearchEverythingViewInterface?)
}
