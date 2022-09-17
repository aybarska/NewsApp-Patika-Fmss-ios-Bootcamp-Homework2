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
    
    var selectedNewsData: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: selectedNewsData.image)
        titleLabel.text = selectedNewsData.title
        descLabel.text = selectedNewsData.description
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func readMoreButtonTapped(_ sender: Any) {
        let webviewVC = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webviewVC?.webViewLink = selectedNewsData.link
        self.navigationController?.pushViewController(webviewVC!, animated: true)
        
    }
}
