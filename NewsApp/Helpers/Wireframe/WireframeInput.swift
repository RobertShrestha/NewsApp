//
//  WireframeInput.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit
protocol WireframeInput {
    var window: UIWindow? {get}
    var view: UIViewController! {get}
    var storyboardName: String {get}
    func openMainView(source: UIViewController, fullScreen: Bool)
    func pushMainView(in source: UINavigationController)
    func getMainView() -> UIViewController
    func openMainViewIn(window: UIWindow)
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController)
    func presentView(in source: UIViewController)
}
extension WireframeInput {
    var window: UIWindow? {
        // swiftlint:disable force_cast
        return (UIApplication.shared.delegate as! AppDelegate).window
    }
    func viewControllerFromStoryboard<T: UIViewController>(of type: T.Type) -> T {
        // swiftlint:disable force_cast
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    func openMainViewIn(window: UIWindow) {
        let view = self.getMainView()
        window.rootViewController = view
    }
    func openMainView(source: UIViewController, fullScreen: Bool = true) {
        let mainView = self.getMainView()
        if fullScreen {
            mainView.modalPresentationStyle = .fullScreen
        }
        source.navigationController?.present(mainView, animated: true, completion: nil)
    }
    func pushMainView(in source: UINavigationController) {
        let mainView = self.getMainView()
        source.pushViewController(mainView, animated: true)
    }
    func presentView(in source: UIViewController) {
        let mainView = self.getMainView()
        mainView.modalPresentationStyle = .overFullScreen
        mainView.modalTransitionStyle = .crossDissolve
        mainView.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        source.present(mainView, animated: true, completion: nil)
    }
    func openViewControllerWithNavigation(viewController: UIViewController, source: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        source.present(nav, animated: true, completion: nil)
    }
}
