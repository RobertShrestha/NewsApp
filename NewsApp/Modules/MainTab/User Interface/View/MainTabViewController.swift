//
//  MainTabViewController.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import UIKit

class MainTabViewController: UITabBarController {

    // MARK: Properties

    // MARK: IBOutlets

    // MARK: VC's Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: IBActions

    // MARK: Other Functions

    private func setup() {
        let firstViewController = HeadlineWireframe().getMainView()
        let firstNavigationController = UINavigationController()

        let headlineTabBarItem = UITabBarItem()
        headlineTabBarItem.image = #imageLiteral(resourceName: "newsIcon")
        headlineTabBarItem.title = "Headline"
        headlineTabBarItem.tag = 1
        firstViewController.tabBarItem = headlineTabBarItem
        firstNavigationController.viewControllers = [firstViewController]


        let secondViewController = SearchEverythingWireframe().getMainView()
        let secondNavigation = UINavigationController()
        let searchTabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        searchTabBarItem.title = "Search"
        secondViewController.tabBarItem = searchTabBarItem
        secondNavigation.viewControllers = [secondViewController]



        let thirdViewController = SourcesWireframe().getMainView()
        let thirdnavigationController = UINavigationController()

        let moreTabBarItem = UITabBarItem()
        moreTabBarItem.image = #imageLiteral(resourceName: "SourceIcon")
        moreTabBarItem.title = "Sources"
        moreTabBarItem.tag = 3
        thirdViewController.tabBarItem = moreTabBarItem
        thirdnavigationController.viewControllers = [thirdViewController]

        let foruthViewController = FavouritesWireframe().getMainView()
        let frouthNavigation = UINavigationController()

        let appointmentTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        appointmentTabBarItem.title = "Saved"
        appointmentTabBarItem.tag = 4
        foruthViewController.tabBarItem = appointmentTabBarItem
        frouthNavigation.viewControllers = [foruthViewController]






        let tabBarList = [firstNavigationController, secondNavigation,thirdnavigationController,frouthNavigation]

        viewControllers = tabBarList
    }
}
