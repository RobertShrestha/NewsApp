//
//  CountrySelectionViewController.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//
//

import UIKit
import RxSwift

class CountrySelectionViewController: UIViewController {

    // MARK: Properties
    var presenter: CountrySelectionModuleInterface?
    var disposeBag = DisposeBag()

    // MARK: IBOutlets
    @IBOutlet var collectionView: UICollectionView!{
        didSet {
            let flowLayout = UICollectionViewFlowLayout()
            let size = (collectionView.frame.size.width - CGFloat(50)) / CGFloat(3)
            flowLayout.itemSize = CGSize(width: size, height: size )
            collectionView.setCollectionViewLayout(flowLayout, animated: true)
            self.collectionView.registerReusableCell(CountrySelectionCollectionViewCell.self)
        }
    }

    // MARK: VC's Life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select Country"
        self.setup()
        self.presenter?.getCountries()
        bindView()
    }

    // MARK: IBActions

    // MARK: Other Functions

    private func setup() {
        // all setup should be done here

    }

    private func bindView() {
        self.presenter?.countries
            .asObservable()
            .bind(to: self.collectionView
                    .rx
                    .items(cellIdentifier: String(describing: CountrySelectionCollectionViewCell.self),
                           cellType: CountrySelectionCollectionViewCell.self)) { _, model, cell in
                            cell.setup(withModel: model)
                }.disposed(by: disposeBag)
        self.presenter?.countries
            .asObservable()
            .bind(onNext: {
                if $0.count < 1 {
                    self.collectionView.setEmptyView(title: MessageConstants.NoCountries.title.value,
                                                message: MessageConstants.NoCountries.message.value)
                } else {
                    self.collectionView.restore()
                }
            }).disposed(by: disposeBag)
        self.collectionView
            .rx
            .itemSelected
            .asDriver()
            .asObservable()
            .bind(to: self.presenter!.countrySelected)
            .disposed(by: disposeBag)
    }
}

// MARK: CountrySelectionViewInterface
extension CountrySelectionViewController: CountrySelectionViewInterface {

}
