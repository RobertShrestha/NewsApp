//
//  UILabel+Extensions.swift
//  Ally-Energy-Audit
//
//  Created by Robert Shrestha on 3/13/20.
//  Copyright © 2020 esrtech. All rights reserved.
//

import UIKit

extension UILabel {
    func set(image: UIImage, with text: String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        let attachmentStr = NSAttributedString(attachment: attachment)

        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentStr)

        let textString = NSAttributedString(string: (" " + text), attributes: [.font: self.font ?? UIFont.boldSystemFont(ofSize: 12)])
        mutableAttributedString.append(textString)

        self.attributedText = mutableAttributedString
    }
}

@IBDesignable
extension UITextField {
    @IBInspectable
    public var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    @IBInspectable
    public var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
}
