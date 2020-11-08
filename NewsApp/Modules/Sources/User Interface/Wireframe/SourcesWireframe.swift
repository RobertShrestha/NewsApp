//
//  SourcesWireframe.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit

class SourcesWireframe {
     weak var view: UIViewController!
}

extension SourcesWireframe: SourcesWireframeInput {

    var storyboardName: String {return "Sources"}

    func getMainView() -> UIViewController {
        let service = SourcesService()
        let interactor = SourcesInteractor(service: service)
        let presenter = SourcesPresenter()
        let viewController = viewControllerFromStoryboard(of: SourcesViewController.self)

        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController

        self.view = viewController
        return viewController
    }
}
