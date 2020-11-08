//
//  MainTabWireframe.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import UIKit

class MainTabWireframe {
     weak var view: UIViewController!
}

extension MainTabWireframe: MainTabWireframeInput {

    var storyboardName: String {return "MainTab"}

    func getMainView() -> UIViewController {
        let viewController = viewControllerFromStoryboard(of: MainTabViewController.self)
        self.view = viewController
        return viewController
    }
}
