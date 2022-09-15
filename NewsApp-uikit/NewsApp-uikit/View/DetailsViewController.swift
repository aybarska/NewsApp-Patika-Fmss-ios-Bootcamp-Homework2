//
//  DetailsViewController.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 13.09.2022. 🧚🏻‍♀️
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    var newTitle = ""
    var newDesc = ""
    var newImage = ""
    var newLink = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: newImage)
        titleLabel.text = newTitle
        descLabel.text = newDesc
    }
    
    @IBAction func readMoreButtonTapped(_ sender: Any) {
        let webviewVC = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webviewVC?.webViewLink = newLink
        self.navigationController?.pushViewController(webviewVC!, animated: true)

    }
}
