//
//  HeadlineTableViewCell.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit
import Kingfisher
class HeadlineTableViewCell: UITableViewCell,Reusable {

    @IBOutlet var articleAuthorLabel: SmallRegularLabel!
    @IBOutlet var articleTimeLabel: SmallRegularLabel!
    @IBOutlet var articleDescriptionLabel: MediumLightLabel!
    @IBOutlet var articleTitleLabel: LargeBoldLabel!
    @IBOutlet var articleSourceLabel: SmallBoldLabel!
    @IBOutlet var articleImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(withArticle article: Article) {
        self.articleAuthorLabel.text = article.author ?? Constants.PlaceholderText.unknown.value
        if let dateString = article.publishedAt {
            self.articleTimeLabel.text =  DateHelper.timeToDate(dateString: dateString).timeAgo()
        }
        self.articleDescriptionLabel.text = article.articleDescription
        self.articleTitleLabel.text = article.title
        self.articleSourceLabel.text = "Source: \(article.source.name)"
        if let imageURL = URL(string: article.urlToImage ?? Constants.placeHolderImageURLString) {
            self.articleImageView.kf.setImage(with: imageURL)
        }

    }
}
