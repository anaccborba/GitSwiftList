//
//  RepositoriesViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation
import UIKit

final class RepositoriesViewController: BaseViewController {
    
    let coordinator: RepositoriesCoordinator
    private let typedView = RepositoriesView()
    private let viewModel = RepositoriesViewModel()
    
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
        
        configureTypedViewActions()
        configureViewModelActions()
        configureErrorViewActions()
        
        viewModel.fetchRepositories()
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
        viewModel.showLoadingView = { [weak self] in
            DispatchQueue.main.async {
                self?.showLoading()
                self?.typedView.backgroundColor = .red
            }
        }
        
        viewModel.hideLoadingView = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoading()
            }
        }
        
        viewModel.showErrorView = { [weak self] in
            DispatchQueue.main.async {
                self?.showError()
            }
        }
        
        viewModel.reloadRepositories = { [weak self] in
            DispatchQueue.main.async {
                self?.hideError()
                if let repositories = self?.viewModel.repositories {
                    self?.typedView.bindView(repositories: repositories)
                }
            }
        }
    }
    
    private func configureErrorViewActions() {
        errorView.tryAgainTap = { [weak self] in
            self?.viewModel.fetchRepositories()
        }
    }
}
