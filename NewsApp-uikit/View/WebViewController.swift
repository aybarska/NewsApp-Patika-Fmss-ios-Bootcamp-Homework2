//
//  WebViewController.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 14.09.2022. 🧚🏻‍♀️
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var detailWebView: WKWebView!
    var webViewLink = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //make label fits into navbar
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
        let newsUrl = URL(string:webViewLink)
        let webRequest = URLRequest(url: newsUrl!)
        detailWebView.load(webRequest)

    }



}
