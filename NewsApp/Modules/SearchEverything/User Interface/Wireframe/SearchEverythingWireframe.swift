//
//  SearchEverythingWireframe.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit

class SearchEverythingWireframe {
     weak var view: UIViewController!
}

extension SearchEverythingWireframe: SearchEverythingWireframeInput {

    var storyboardName: String {return "SearchEverything"}

    func getMainView() -> UIViewController {
        let service = SearchEverythingService()
        let interactor = SearchEverythingInteractor(service: service)
        let presenter = SearchEverythingPresenter()
        let viewController = viewControllerFromStoryboard(of: SearchEverythingViewController.self)

        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController

        self.view = viewController
        return viewController
    }
    func goToArticle(withArticle article: Article, view:  SearchEverythingViewInterface?) {
        guard let viewVC = view as? UIViewController else {
            log.error("Invalid View Protocol type")
            fatalError("Invalid View Protocol type")
        }
        ArticleWireframe(with: article).pushMainView(in: viewVC.navigationController!)
    }
}
