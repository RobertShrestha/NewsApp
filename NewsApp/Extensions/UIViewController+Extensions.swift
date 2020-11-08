//
//  UIViewController+Extensions.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
import UIKit
import MBProgressHUD
extension UIViewController {
    open override func awakeFromNib() {
        // swiftlint:disable line_length
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Constants.back, style: .plain, target: nil, action: nil)
    }
    func getAlert(message: String?, title: String?) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    func alert(message: String?) {
        let alertController = getAlert(message: message, title: nil)
        alertController.addAction(title: Constants.labelOk, handler: nil)
        alertController.modalPresentationStyle = .fullScreen
        self.present(alertController, animated: true, completion: nil)
    }
    func alert(message: String?, title: String? = "", okAction: (() -> Void)? = nil) {
        let alertController = getAlert(message: message, title: title)
        alertController.addAction(title: Constants.labelOk, handler: okAction)
        alertController.modalPresentationStyle = .fullScreen
        self.present(alertController, animated: true, completion: nil)
    }
    func alertWithOkCancel(message: String?, title: String? = "", okTitle: String? = Constants.labelOk, cancelTitle: String? = Constants.cancel, cancelStyle: UIAlertAction.Style = .default, okAction: (() -> Void)? = nil, cancelAction: (() -> Void)? = nil) {
        let alertController = getAlert(message: message, title: title)
        alertController.addAction(title: okTitle, handler: okAction)
        alertController.addAction(title: cancelTitle, style: cancelStyle, handler: cancelAction)
        alertController.modalPresentationStyle = .fullScreen
        self.present(alertController, animated: true, completion: nil)
    }
    private func setProgressHud() -> MBProgressHUD {
        let progressHud: MBProgressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHud.tintColor = UIColor.darkGray
        progressHud.removeFromSuperViewOnHide = true
        progressHud.label.textColor = .darkGray
        objc_setAssociatedObject(self, &Associate.hud, progressHud, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return progressHud
    }
    var progressHud: MBProgressHUD {
        if let progressHud = objc_getAssociatedObject(self, &Associate.hud) as? MBProgressHUD {
            progressHud.isUserInteractionEnabled = true
            return progressHud
        }
        return setProgressHud()
    }
    var progressHudIsShowing: Bool {
        return self.progressHud.isHidden
    }
    func showProgressHud() {
        self.progressHud.show(animated: false)
    }
    func showProgressHud(label: String = "") {
        self.progressHud.label.text = label
        self.progressHud.show(animated: false)
    }
    func hideProgressHud() {
        self.progressHud.label.text = ""
        self.progressHud.completionBlock = {
            objc_setAssociatedObject(self, &Associate.hud, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        self.progressHud.hide(animated: false)
    }
    func setupBackButton() {
        let customBackButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = customBackButton
    }
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    func dismiss(completion: (() -> Void)?) {
        self.dismiss(animated: true, completion: completion)
    }
    func presentActivity(activityVC:UIActivityViewController) {
        self.present(activityVC, animated: true, completion: nil)
    }

    func setNavigationBarLeftItems(tapped:@escaping ( () -> Void )) {
        let sideMenu = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        sideMenu.setImage(#imageLiteral(resourceName: "SideMenuIcon"), for: .normal)
        sideMenu.addAction(action: tapped)
        let sideMenuButtonItem = UIBarButtonItem(customView: sideMenu)
        self.navigationItem.leftBarButtonItems = [sideMenuButtonItem]
    }

    func setNavigationBarBackButtonLeftItems(tapped:@escaping ( () -> Void )) {
        let sideMenu = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        sideMenu.setImage(#imageLiteral(resourceName: "BackIcon"), for: .normal)
        sideMenu.addAction(action: tapped)
        let sideMenuButtonItem = UIBarButtonItem(customView: sideMenu)
        self.navigationItem.leftBarButtonItems = [sideMenuButtonItem]
    }

    func setNavigationBarRightItems(withTitle title: String, tapped:@escaping ( () -> Void )) {
        let sideMenu = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        sideMenu.setTitle(title, for: .normal)
        sideMenu.titleLabel?.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .small)
        sideMenu.addAction(action: tapped)
        let sideMenuButtonItem = UIBarButtonItem(customView: sideMenu)
        self.navigationItem.rightBarButtonItems = [sideMenuButtonItem]
    }

    func setNavigationBarRightItems(tapped:@escaping ( () -> Void )) {
        let notificationButton =  UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        notificationButton.setImage(#imageLiteral(resourceName: "NotificationIcon"), for: .normal)
        notificationButton.addAction(action: tapped)
        // cartButton.addTarget(self, action: #selector(displayCart), for: .touchUpInside)
        let notificationButtonItem = UIBarButtonItem(customView: notificationButton)
        self.navigationItem.setRightBarButton(notificationButtonItem, animated: true)
    }
    func setEditBarRightItems(tapped:@escaping ( () -> Void )) {
        let notificationButton =  UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        notificationButton.setImage(#imageLiteral(resourceName: "EditIcon"), for: .normal)
        notificationButton.addAction(action: tapped)
        // cartButton.addTarget(self, action: #selector(displayCart), for: .touchUpInside)
        let notificationButtonItem = UIBarButtonItem(customView: notificationButton)
        self.navigationItem.setRightBarButton(notificationButtonItem, animated: true)
    }
    func setAddBarRightItems(tapped:@escaping ( () -> Void )) {
        let notificationButton =  UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        notificationButton.setImage(#imageLiteral(resourceName: "AddIcon"), for: .normal)
        notificationButton.addAction(action: tapped)
        // cartButton.addTarget(self, action: #selector(displayCart), for: .touchUpInside)
        let notificationButtonItem = UIBarButtonItem(customView: notificationButton)
        self.navigationItem.setRightBarButton(notificationButtonItem, animated: true)
    }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
struct Associate {
    static var hud: UInt8 = 0
}
// swiftlint:disable all
extension UINavigationController {

    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }

    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }

    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }
}
