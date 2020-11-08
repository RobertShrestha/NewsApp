//
//  UIButton+Custom.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//

import UIKit
@IBDesignable
class LinkButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }

    override func prepareForInterfaceBuilder() {
        initializeLabel()

    }

    func initializeLabel() {
        self.titleLabel?.font = FontConstants.setDefaultFont(withFont: .medium, withSize: .xsmall)
        self.setTitleColor(ColorConstants.primaryBlue, for: .normal)
        self.updateConstraintsIfNeeded()
    }
}
