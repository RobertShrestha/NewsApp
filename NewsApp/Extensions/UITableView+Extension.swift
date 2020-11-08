//
//  UITableView+Extension.swift
//  Easy HealthCare
//
//  Created by Robert Shrestha on 12/23/19.
//
import UIKit

// Useful link
// https://alisoftware.github.io/swift/generics/2016/01/06/generic-tableviewcells/
//https://medium.com/over-engineering/an-easier-way-to-dequeue-cells-in-ios-5c8b8de4dfed

// MARK: - UITableview Extensions
/*
protocol Reusable {}
extension UITableViewCell: Reusable {}
extension Reusable where Self: UITableViewCell {
    static var resuseID: String {
        return String(describing: self)
    }
}
protocol NibReusable: Reusable {
    static var nib: UINib { get }
}
extension NibReusable where Self: UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
extension UITableViewCell: NibReusable {}

extension UITableView {

    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.registerNib(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    func dequeueResuableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        // swiftlint:disable line_length
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.resuseID, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)")
        }
        return cell
    }
}

// MARK: - UICollectionView Extensions
extension UICollectionViewCell: Reusable {}
extension Reusable where Self: UICollectionViewCell {
    static var resuseID: String {
        return String(describing: self)
    }
}
extension UICollectionView {
    func dequeueResuableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.resuseID, for: indexPath) as? Cell else { fatalError("Fatal error for cell at \(indexPath)")
        }
        return cell
    }
}
*/
protocol Reusable: class {
    static var reuseIdentifier: String { get }
    static var nib: UINib? { get }
}

extension Reusable {
    static var reuseIdentifier: String { return String(describing: self) }
    static var nib: UINib? { return nil }
}

extension UITableView {
    func registerReusableCell<T: UITableViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }

    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
        }
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T? where T: Reusable {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T?
    }
}

extension UICollectionView {
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        if let nib = T.nib {
            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: NSIndexPath) -> T where T: Reusable {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }

    func registerReusableSupplementaryView<T: Reusable>(elementKind: String, _: T.Type) {
        if let nib = T.nib {
            self.register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseIdentifier)
        }
    }

    func dequeueReusableSupplementaryView<T: UICollectionViewCell>(elementKind: String, indexPath: NSIndexPath) -> T where T: Reusable {
        return self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath as IndexPath) as! T
    }
}
// MARK: - Handle Empty TableView
extension UITableView {
    func setEmptyView(title: String, message: String, messageImage: UIImage) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        messageImageView.backgroundColor = .clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .small)
        titleLabel.textColor = ColorConstants.secondary1
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = FontConstants.setDefaultFont(withFont: .regular, withSize: .large)
        messageLabel.textColor = ColorConstants.secondary2
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: 0).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: messageImageView.topAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: 10).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 10).isActive = true
        messageImageView.image = messageImage
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
     func setEmptyView(title: String, message: String, messageImage: UIImage, buttonTapped: (() -> Void)? = nil) {
         let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
         let messageImageView = UIImageView()
         let titleLabel = UILabel()
         let messageLabel = UIButton()
         messageImageView.backgroundColor = .clear
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         messageImageView.translatesAutoresizingMaskIntoConstraints = false
         messageLabel.translatesAutoresizingMaskIntoConstraints = false
         titleLabel.textColor = UIColor.black
         titleLabel.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .small)
         titleLabel.textColor = ColorConstants.secondary1
         //messageLabel.titleLabel?.textColor = UIColor.lightGray
         messageLabel.setTitleColor(ColorConstants.secondary2, for: .normal)
         messageLabel.titleLabel?.font = FontConstants.setDefaultFont(withFont: .regular, withSize: .medium)
         // messageLabel.titleLabel?.textColor = ColorConstants.secondary2
         if let action = buttonTapped {
         messageLabel.addAction(action: action)
         }
         emptyView.addSubview(titleLabel)
         emptyView.addSubview(messageImageView)
         emptyView.addSubview(messageLabel)
         messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
         messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: 0).isActive = true
         messageImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
         messageImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
         titleLabel.bottomAnchor.constraint(equalTo: messageImageView.topAnchor, constant: -10).isActive = true
         titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
         messageLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
         messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
         messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: 10).isActive = true
         messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 10).isActive = true
         messageImageView.image = messageImage
         titleLabel.text = title
         messageLabel.setTitle(message, for: .normal)
         //messageLabel.text = message
         //        messageLabel.numberOfLines = 0
         messageLabel.titleLabel?.textAlignment = .center
         self.backgroundView = emptyView
         self.separatorStyle = .none
         }
        func restore() {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }
}
extension UICollectionView {
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
    }
    func restore() {
        self.backgroundView = nil
    }
}
