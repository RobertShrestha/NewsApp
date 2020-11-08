//
//  CountrySelectionWireframe.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import UIKit

enum CountrySelectionNavigations {
    case initial
    case other
}

class CountrySelectionWireframe {


    weak var view: UIViewController!
    var flow: CountrySelectionNavigations = .initial
    init(flow: CountrySelectionNavigations) {
        self.flow = flow
    }
}

extension CountrySelectionWireframe: CountrySelectionWireframeInput {


    var storyboardName: String {return "CountrySelection"}

    func getMainView() -> UIViewController {
        let service = CountrySelectionService()
        let interactor = CountrySelectionInteractor(service: service)
        let presenter = CountrySelectionPresenter(flow: flow)
        let viewController = viewControllerFromStoryboard(of: CountrySelectionViewController.self)

        viewController.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = viewController

        self.view = viewController
        return viewController
    }


    func goToMainTab(view: CountrySelectionViewInterface?) {
        guard let viewVC = view as? UIViewController else {
            log.error("Invalid View Protocol type")
            fatalError("Invalid View Protocol type")
        }
        MainTabWireframe().pushMainView(in: viewVC.navigationController!)
    }
}
