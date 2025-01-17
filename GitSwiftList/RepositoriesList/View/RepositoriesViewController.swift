//
//  RepositoriesViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation
import UIKit

final class RepositoriesViewController: UIViewController {
    
    private let typedView = RepositoriesView()
    private let viewModel = RepositoriesViewModel()
    
    private let errorView = DSErrorView()
    private var loadingView: DSLoadingView?
    
    override func loadView() {
        super.loadView()
        view = typedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Repositórios Swift"
        
        viewModel.fetchRepositories()
        configureViewModelActions()
        configureErrorViewActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoading()
    }
    
    private func configureViewModelActions() {
        viewModel.reloadRepositories = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoading()
                self?.hideError()
                if let repositories = self?.viewModel.repositories {
                    self?.typedView.bindView(repositories: repositories)
                }
            }
        }
        
        viewModel.showErrorView = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoading()
                self?.showError()
            }
        }
    }
    
    private func configureErrorViewActions() {
        errorView.tryAgainTap = { [weak self] in
            self?.viewModel.fetchRepositories()
        }
    }
    
    private func showError() {
        errorView.bounds = view.bounds
        errorView.frame = view.frame
        view.addSubview(errorView)
    }
    
    private func hideError() {
        errorView.removeFromSuperview()
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
}
