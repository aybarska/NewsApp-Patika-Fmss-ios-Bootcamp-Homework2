//
//  NewsCollectionViewCell.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 12.09.2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "NewsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage) {
        imageView.image = image
    }

    static func nib()-> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
