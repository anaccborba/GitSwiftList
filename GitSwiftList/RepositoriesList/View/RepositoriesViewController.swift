//
//  RepositoriesViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation
import UIKit

final class RepositoriesViewController: UIViewController {
    
    private let coordinator: RepositoriesCoordinator
    private let typedView = RepositoriesView()
    private let viewModel = RepositoriesViewModel()
    private let errorView = DSErrorView()
    private var loadingView: DSLoadingView?
    
    override func loadView() {
        super.loadView()
        view = typedView
    }
    
    init(coordinator: RepositoriesCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = NSLocalizedString("repositoriesNavigationTitle", comment: "Localizable")
        
        viewModel.fetchRepositories()
        configureTypedViewActions()
        configureViewModelActions()
        configureErrorViewActions()
    }
    
    private func configureTypedViewActions() {
        typedView.repositoryCellTap = { [weak self] repository in
            self?.coordinator.didFinish(repository: repository)
        }
        
        typedView.reloadRepositories = { [weak self] in
            self?.viewModel.fetchRepositories()
        }
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
