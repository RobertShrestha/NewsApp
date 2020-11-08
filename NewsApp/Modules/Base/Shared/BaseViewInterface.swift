//
//  BaseViewInterface.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit
protocol BaseViewInterface {
    func showProgressHud()
    func showProgressHud(label: String)
    func hideProgressHud()
    func alert(message: String?)
    func alert(message: String?, title: String?, okAction: (() -> Void)?)
    // swiftlint:disable line_length function_parameter_count
    func alertWithOkCancel(message: String?, title: String?, okTitle: String?, cancelTitle: String?, cancelStyle: UIAlertAction.Style, okAction: (() -> Void)?, cancelAction: (() -> Void)?)
    func popVC()
    func dismiss(completion: (() -> Void)?)
    func presentActivity(activityVC:UIActivityViewController)
}
