//
//  HeadlineWireframe.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import UIKit

class HeadlineWireframe {
     weak var view: UIViewController!
}

extension HeadlineWireframe: HeadlineWireframeInput {

    var storyboardName: String {return "Headline"}

    func getMainView() -> UIViewController {
        let service = HeadlineService()
        let interactor = HeadlineInteractor(service: service)
        let presenter = HeadlinePresenter()
        let viewController = viewControllerFromStoryboard(of: HeadlineViewController.self)

        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController

        self.view = viewController
        return viewController
    }
    func goToArticle(withArticle article: Article, view: HeadlineViewInterface?) {
        guard let viewVC = view as? UIViewController else {
            log.error("Invalid View Protocol type")
            fatalError("Invalid View Protocol type")
        }
        ArticleWireframe(with: article).pushMainView(in: viewVC.navigationController!)
    }
    func goToSelectCountry(view: HeadlineViewInterface?) {
        guard let viewVC = view as? UIViewController else {
            log.error("Invalid View Protocol type")
            fatalError("Invalid View Protocol type")
        }
        CountrySelectionWireframe(flow: .other).pushMainView(in: viewVC.navigationController!)
       // viewVC.view.window?.rootViewController = UINavigationController(rootViewController: CountrySelectionWireframe().getMainView())
    }
}
