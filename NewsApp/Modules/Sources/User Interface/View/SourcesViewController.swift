//
//  SourcesViewController.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit
import RxSwift
import RxCocoa
class SourcesViewController: UIViewController {

    // MARK: Properties

    var presenter: SourcesModuleInterface?
    var disposeBag = DisposeBag()
    // MARK: IBOutlets

    @IBOutlet var tableView: UITableView!
    // MARK: VC's Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sources"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.setup()
        self.presenter?.getSources(category: .general)
        self.bindViews()
    }

    // MARK: IBActions

    // MARK: Other Functions

    private func setup() {
        // all setup should be done here
    }

    private func bindViews() {
        self.presenter?.sources
            .asObservable()
            .bind(to: self.tableView
                    .rx
                    .items(cellIdentifier: String(describing: UITableViewCell.self), cellType: UITableViewCell.self)) { _, model, cell in
                cell.textLabel?.text = model.name
                cell.detailTextLabel?.text = model.sourceDescription
                cell.textLabel?.font = FontConstants.setDefaultFont(withFont: .bold, withSize: .medium)
                cell.detailTextLabel?.font = FontConstants.setDefaultFont(withFont: .light, withSize: .small)
            }.disposed(by: disposeBag)
        self.presenter?.sources
            .asObservable()
            .bind(onNext: {
                if $0.count < 1 {
                    self.tableView.setEmptyView(title: MessageConstants.NoSource.title.rawValue,
                                                message: MessageConstants.NoSource.message.rawValue,
                                                messageImage: #imageLiteral(resourceName: "SadEmoji"))
                } else {
                    self.tableView.restore()
                }
            }).disposed(by: disposeBag)
        self.tableView
            .rx
            .itemSelected
            .asObservable()
            .bind(to: self.presenter!.selectedSource)
            .disposed(by: disposeBag)
    }
}

// MARK: SourcesViewInterface
extension SourcesViewController: SourcesViewInterface {

}
