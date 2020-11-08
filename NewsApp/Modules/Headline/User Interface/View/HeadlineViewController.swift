//
//  HeadlineViewController.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import UIKit
import RxSwift
import RxCocoa
class HeadlineViewController: UIViewController {

    // MARK: Properties

    var presenter: HeadlineModuleInterface?
    var disposeBag = DisposeBag()

    // MARK: IBOutlets
    @IBOutlet var tableView: UITableView! {
        didSet {
            self.tableView.rowHeight = UITableView.automaticDimension
            self.tableView.estimatedRowHeight = 1000.0
        }
    }
    let button = UIButton()
    // MARK: VC's Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Headline"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.setup()
        self.bindViews()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.getArticles(category: .general)
        setupNavigationBarItem()
    }

    func setupNavigationBarItem() {
        let selectedCountry = UserDefaultsConstants.selectedCountry.decoded() as CountryModel
        //let countryButton = UIBarButtonItem(image: UIImage(named:selectedCountry.code.lowercased()), style: .done, target: self, action: nil)
        let barButton = UIBarButtonItem()
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        let image = UIImage(named: selectedCountry.code.lowercased())!
        UIGraphicsBeginImageContextWithOptions(button.frame.size, false, image.scale)
        let rect  = CGRect(x: 0, y: 0, width: button.frame.size.width, height: button.frame.size.height)
        UIBezierPath(roundedRect: rect, cornerRadius: rect.width/2).addClip()
        image.draw(in: rect)
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
        UIGraphicsEndImageContext()
            let color = UIColor(patternImage: newImage)
            button.backgroundColor = color
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            barButton.customView = button
            self.navigationItem.rightBarButtonItem = barButton
        }
        let fliterButton = UIBarButtonItem(image: #imageLiteral(resourceName: "CategoryIcon"), style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [barButton,fliterButton]
        fliterButton.rx.tap.subscribe(onNext: {
            self.handleActionSheet()
        }).disposed(by: disposeBag)

    }
    // MARK: IBActions

    // MARK: Other Functions

    private func setup() {
        // all setup should be done here
    }
    private func handleActionSheet() {
        let alert = UIAlertController(title: "Category", message: "Please Select an Option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "General", style: .default , handler:{ (UIAlertAction)in
            self.presenter?.getArticles(category: .general)
        }))
        alert.addAction(UIAlertAction(title: "Business", style: .default , handler:{ (UIAlertAction)in
            self.presenter?.getArticles(category: .business)
        }))

        alert.addAction(UIAlertAction(title: "Entertainment", style: .default , handler:{ (UIAlertAction)in
            self.presenter?.getArticles(category: .entertainment)
        }))
        alert.addAction(UIAlertAction(title: "Sports", style: .default , handler:{ (UIAlertAction)in
            self.presenter?.getArticles(category: .sports)
        }))

        alert.addAction(UIAlertAction(title: "Technology", style: .default , handler:{ (UIAlertAction)in
            self.presenter?.getArticles(category: .technology)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))


        //uncomment for iPad Support
        //alert.popoverPresentationController?.sourceView = self.view

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }

    private func bindViews() {
        self.presenter?.articles
            .asObservable()
            .bind(to: self.tableView
                    .rx
                    .items(cellIdentifier: String(describing: HeadlineTableViewCell.self), cellType: HeadlineTableViewCell.self)) { _, model, cell in
                cell.setup(withArticle: model)
            }.disposed(by: disposeBag)
        self.presenter?.articles
            .asObservable()
            .bind(onNext: {
                if $0.count < 1 {
                    self.tableView.setEmptyView(title: MessageConstants.NoHeadline.title.rawValue,
                                                message: MessageConstants.NoHeadline.message.rawValue,
                                                messageImage: #imageLiteral(resourceName: "SadEmoji"))
                } else {
                    self.tableView.restore()
                }
            }).disposed(by: disposeBag)
        self.tableView
            .rx
            .itemSelected
            .asObservable()
            .bind(to: self.presenter!.selectedArticle)
            .disposed(by: disposeBag)
        button.rx
            .tap
            .bind(to: self.presenter!.selectCountryTapped)
            .disposed(by: disposeBag)
    }
}

// MARK: HeadlineViewInterface
extension HeadlineViewController: HeadlineViewInterface {

}
