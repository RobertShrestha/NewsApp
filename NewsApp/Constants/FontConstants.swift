//
//  FontConstants.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit
struct FontConstants {
    static func setDefaultFont(withFont fontName: FontNames.Roboto, withSize size: FontSize) -> UIFont {
        return UIFont(name: fontName.rawValue, size: size.rawValue)!
    }


}
struct FontNames {
    enum Roboto: String {
        case bold = "Roboto-Bold"
        case regular = "Roboto-Regular"
        case light = "Roboto-Light"
        case thin = "Roboto-Thin"
        case medium = "Roboto-Medium"
    }
}
enum FontSize: CGFloat {
    case xsmall = 12
    case small = 14
    case medium = 16
    case large = 18
}
