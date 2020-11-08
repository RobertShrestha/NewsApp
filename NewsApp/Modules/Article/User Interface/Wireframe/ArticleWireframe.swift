//
//  ArticleWireframe.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit

class ArticleWireframe {
     weak var view: UIViewController!

    var article: Article
    init(with article: Article) {
        self.article = article
    }
}

extension ArticleWireframe: ArticleWireframeInput {

    var storyboardName: String {return "Article"}

    func getMainView() -> UIViewController {
        let service = ArticleService()
        let interactor = ArticleInteractor(service: service)
        let presenter = ArticlePresenter(with: article)
        let viewController = viewControllerFromStoryboard(of: ArticleViewController.self)

        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController

        self.view = viewController
        return viewController
    }
}
