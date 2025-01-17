//
//  PullRequestDetailWebView.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//


import UIKit
import WebKit

class PullRequestDetailWebView: UIViewController, WKNavigationDelegate {
    var webView: WKWebView = WKWebView()
    var url: String
    private var loadingView: DSLoadingView?
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.allowsBackForwardNavigationGestures = true
        if let url = URL(string: self.url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showLoading()
    }
    
    private func showLoading() {
        loadingView = DSLoadingView(frame: view.bounds)
        if let loadingView = loadingView {
            view.addSubview(loadingView)
        }
    }
    
    private func hideLoading() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideLoading()
    }
}
