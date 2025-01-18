//
//  BaseViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    public let errorView = DSErrorView()
    public var loadingView = DSLoadingView()
    
    public func showError() {
        errorView.frame = view.frame
        view.addSubview(errorView)
    }
    
    public func hideError() {
        errorView.removeFromSuperview()
    }
    
    public func showLoading() {
        loadingView.frame = view.frame
        view.addSubview(loadingView)
    }
    
    public func hideLoading() {
        loadingView.removeFromSuperview()
    }
}
