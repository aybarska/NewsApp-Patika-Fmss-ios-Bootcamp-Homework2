//
//  DetailsViewController.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 13.09.2022.
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
        
        print("item secildi \(newDesc)")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func readMoreButtonTapped(_ sender: Any) {
        
    }
}
