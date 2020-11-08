//
//  FavouritesViewController.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit
import RxSwift
import RxCocoa
class FavouritesViewController: UIViewController {

    // MARK: Properties

    var presenter: FavouritesModuleInterface?
    var disposeBag = DisposeBag()
    // MARK: IBOutlets
    @IBOutlet var tableView: UITableView!

    // MARK: VC's Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        bindViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.getArticles()
    }

    // MARK: IBActions

    // MARK: Other Functions

    private func setup() {
        // all setup should be done here
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
                    self.tableView.setEmptyView(title: MessageConstants.NoSaveArticle.title.rawValue,
                                                message: MessageConstants.NoSaveArticle.message.rawValue,
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
    }
}

// MARK: FavouritesViewInterface
extension FavouritesViewController: FavouritesViewInterface {

}
