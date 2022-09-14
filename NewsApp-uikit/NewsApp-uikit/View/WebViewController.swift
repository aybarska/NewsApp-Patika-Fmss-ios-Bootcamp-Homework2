//
//  WebViewController.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 14.09.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var detailWebView: WKWebView!
    var webViewLink = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let newsUrl = URL(string:webViewLink)
        let webRequest = URLRequest(url: newsUrl!)
        detailWebView.load(webRequest)

    }
}
