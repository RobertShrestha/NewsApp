//
//  UIAlertController+Extensions.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit

extension UIAlertController {
    func addAction(title: String?, style: UIAlertAction.Style = .default, handler: (() -> Void)? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: {_ in
            handler?()
        })
        self.addAction(action)
    }
}
