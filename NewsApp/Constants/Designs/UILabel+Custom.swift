//
//  UILabel+Custom.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit

// MARK: - Bold UILabels

@IBDesignable
class XSmallBoldLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .xsmall)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}
@IBDesignable
class SmallBoldLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .small)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

@IBDesignable
class MediumBoldLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .medium)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

@IBDesignable
class LargeBoldLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .large)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

// MARK: - Regular UILabels
@IBDesignable
class SmallRegularLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .regular, withSize: .small)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

@IBDesignable
class MediumRegularLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .regular, withSize: .medium)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

@IBDesignable
class LargeRegularLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .regular, withSize: .large)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

// MARK: - Light UILabels
@IBDesignable
class SmallLightLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .light, withSize: .small)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

@IBDesignable
class MediumLightLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .light, withSize: .medium)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}

@IBDesignable
class LargeLightLabel: UILabel {

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
        self.font = FontConstants.setDefaultFont(withFont: .light, withSize: .large)
        self.textColor = ColorConstants.secondary1
        self.updateConstraintsIfNeeded()
    }
}
