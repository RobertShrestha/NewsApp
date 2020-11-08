//
//  SearchEverythingViewController.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit
import RxSwift
import RxCocoa
class SearchEverythingViewController: UIViewController {

    // MARK: Properties

    var presenter: SearchEverythingModuleInterface?
    var disposeBag = DisposeBag()
    // MARK: IBOutlets
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            self.searchBar.text = "Trump"
        }
    }
    @IBOutlet var tableView: UITableView!

    // MARK: VC's Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViews()
        self.setup()

    }

    // MARK: IBActions

    // MARK: Other Functions

    private func setup() {
        // all setup should be done here
    }

    private func bindViews() {
        self.searchBar
            .rx
            .text
            .orEmpty
            .changed
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .bind(to: self.presenter!.query)
            .disposed(by: disposeBag)
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
    }
}

// MARK: SearchEverythingViewInterface
extension SearchEverythingViewController: SearchEverythingViewInterface {

}
