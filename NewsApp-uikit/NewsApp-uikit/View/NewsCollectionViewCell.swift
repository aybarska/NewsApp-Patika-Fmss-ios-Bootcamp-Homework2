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
    @IBOutlet weak var labelContainer: UIView!
    

    static let identifier = "NewsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        imageView.layer.shadowRadius = 20
        imageView.layer.shadowOpacity = 1.0
        imageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        imageView.layer.shadowColor = UIColor.gray.cgColor
    }
    
    public func configure(image: UIImage,title: String) {
        titleLabel.text = title
        imageView.image = image
    }

    static func nib()-> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
