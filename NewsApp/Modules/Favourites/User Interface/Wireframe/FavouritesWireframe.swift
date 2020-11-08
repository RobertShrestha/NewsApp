//
//  FavouritesWireframe.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit

class FavouritesWireframe {
     weak var view: UIViewController!
}

extension FavouritesWireframe: FavouritesWireframeInput {

    var storyboardName: String {return "Favourites"}

    func getMainView() -> UIViewController {
        let service = FavouritesService()
        let interactor = FavouritesInteractor(service: service)
        let presenter = FavouritesPresenter()
        let viewController = viewControllerFromStoryboard(of: FavouritesViewController.self)

        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController

        self.view = viewController
        return viewController
    }
}
