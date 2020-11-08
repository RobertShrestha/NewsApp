//
//  View+Custom.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit
@IBDesignable
class CircularCorneredView: UIView {
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
        self.layer.cornerRadius = self.layer.frame.height/2
        self.backgroundColor = ColorConstants.secondaryGray
        self.layer.borderColor = ColorConstants.primaryBlue.cgColor
        self.layer.borderWidth = 0.5
        self.clipsToBounds = true
        self.updateConstraintsIfNeeded()
    }
}
