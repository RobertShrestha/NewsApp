//
//  CountrySelectionCollectionViewCell.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import UIKit

class CountrySelectionCollectionViewCell: UICollectionViewCell,Reusable {
    @IBOutlet var flagImageView: UIImageView!
    @IBOutlet var countryNameLabel: MediumBoldLabel!

    static var nib: UINib? {
        return UINib(nibName: String(describing:CountrySelectionCollectionViewCell.self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(withModel model: CountryModel) {
       self.flagImageView.image = UIImage(named: "\(model.code.lowercased())")
        self.countryNameLabel.text = model.name
    }

}
