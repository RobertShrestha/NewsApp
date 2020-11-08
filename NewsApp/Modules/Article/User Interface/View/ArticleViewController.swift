//
//  ArticleViewController.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa
class ArticleViewController: UIViewController {

    // MARK: Properties

    var presenter: ArticleModuleInterface?
    var disposeBag = DisposeBag()

    // MARK: IBOutlets
    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var articleAuthorLabel: XSmallBoldLabel!
    @IBOutlet var articleTitleLabel: LargeBoldLabel!
    @IBOutlet var articleContentLabel: MediumLightLabel!
    @IBOutlet var continueButton: LinkButton!
    @IBOutlet var articleSourceLabel: SmallBoldLabel!
    @IBOutlet var articleTimeLabel: SmallRegularLabel!
    
    // MARK: VC's Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        self.setup()
        bindView()
        setupNavigationButton()
    }

    func setupNavigationButton() {
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)

        let favouriteButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        self.navigationItem.setRightBarButtonItems([favouriteButton,shareButton], animated: true)
        shareButton
            .rx
            .tap
            .bind(to: self.presenter!.shareButtonTapped)
            .disposed(by: disposeBag)
        favouriteButton
            .rx
            .tap
            .bind(to: self.presenter!.saveButtonTapped)
            .disposed(by: disposeBag)
    }



    // MARK: IBActions

    // MARK: Other Functions

    private func setup() {
        // all setup should be done here
    }
    private func bindView() {
        self.presenter?
            .article
            .subscribe(onNext: {
            if let article = $0 {
                if let imageURL = URL(string: article.urlToImage ?? Constants.placeHolderImageURLString) {
                    self.articleImageView.kf.setImage(with: imageURL)
                }
                self.articleAuthorLabel.text = "Author: " + (article.author ?? Constants.PlaceholderText.unknown.value)
                if let dateString = article.publishedAt {
                    self.articleTimeLabel.text =  DateHelper.timeToDate(dateString: dateString).timeAgo()
                }
                self.articleContentLabel.text = article.content
                self.articleTitleLabel.text = article.title
                self.articleSourceLabel.text = "Source: \(article.source.name)"
                if let imageURL = URL(string: article.urlToImage ?? Constants.placeHolderImageURLString) {
                    self.articleImageView.kf.setImage(with: imageURL)
                }
            }

        }).disposed(by: disposeBag)
        self.continueButton
            .rx
            .tap
            .bind(to: self.presenter!.continueButtonTapped)
            .disposed(by: disposeBag)
    }
}

// MARK: ArticleViewInterface
extension ArticleViewController: ArticleViewInterface {

}
