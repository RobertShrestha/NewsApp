//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/6/20.
//

import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Library manager
        let libsManager = LibsManager(window: window, application: application)
        libsManager.setupLibs()
        handleNavigation()
        return true
    }

    func handleNavigation() {
        let navigationController = UINavigationController()
        if UserDefaultsConstants.selectedCountry == Data() {
            let countrySelectionVC = CountrySelectionWireframe(flow: .initial).getMainView()
            navigationController.viewControllers = [countrySelectionVC]
        } else {
            let countrySelectionVC = MainTabWireframe().getMainView()
            navigationController.setNavigationBarHidden(true, animated: true)
            navigationController.viewControllers = [countrySelectionVC]
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    


}

