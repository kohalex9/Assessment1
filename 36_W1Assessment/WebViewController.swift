//
//  WebViewController.swift
//  36_W1Assessment
//
//  Created by Alex Koh on 11/08/2017.
//  Copyright © 2017 AlexKoh. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    var urlText: String = ""

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        
        urlText = "https://www.google.com"
        loadTheUrl(with: urlText)
        
    }
    
    func loadTheUrl(with string: String) {
        guard let url = URL(string: string) else {
            print("Invalid urlString: \(string)")
            return
        }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }

    
    
    



}
