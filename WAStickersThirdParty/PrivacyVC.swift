//
//  PrivacyVC.swift
//  StickerApp
//
//  Created by Danish Munir on 03/11/2020.
//  Copyright © 2020 WhatsApp. All rights reserved.
//

import UIKit
import WebKit
class PrivacyVC: UIViewController , WKNavigationDelegate {
    
    
   @IBOutlet weak var webview  : WKWebView!
    var activity = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(webview)
        loadWebview()
        self.webview.navigationDelegate = self
    }
    
    
    func Start() {
        self.view.addSubview(activity)
        activity.center =  self.view.center
        activity.color = .gray
        activity.startAnimating()
    
    }
    func Stop()  {
        activity.stopAnimating()
        activity.removeFromSuperview()
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Stop()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Start()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Stop()
    }
    
    
   /* func setupWebView(){
        webview.translatesAutoresizingMaskIntoConstraints = false
        webview.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 0).isActive = true
        webview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor , constant: 0).isActive = true
        webview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: 0).isActive = true
        webview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 0).isActive = true
    } */
   
    
    func loadWebview(){
     let url = URL(string: "https://www.poshy-couture.com/store-policy")
        webview.load(URLRequest(url: url!))
    }
}
