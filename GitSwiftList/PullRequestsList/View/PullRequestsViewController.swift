//
//  PullRequestsViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation
import UIKit

final class PullRequestsViewController: BaseViewController {
    
    private let typedView = PullRequestsView()
    private let viewModel: PullRequestsViewModel
    private let coordinator: PullRequestsCoordinator
    
    override func loadView() {
        super.loadView()
        view = typedView
    }
    
    init(viewModel: PullRequestsViewModel, coordinator: PullRequestsCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("pullRequestsNavigationTitle", comment: "Localizable")
        
        viewModel.fetchPullRequests()
        configureTypedViewActions()
        configureViewModelActions()
        configureErrorViewActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoading()
    }
    
    private func configureViewModelActions() {
        viewModel.reloadPullRequests = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoading()
                self?.hideError()
                if let pullRequests = self?.viewModel.pullRequests {
                    self?.typedView.bindView(pullRequests: pullRequests)
                }
            }
        }
        
        viewModel.showErrorView = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoading()
                self?.showError()
            }
        }
        
        viewModel.showLoadingView = { [weak self] in
            DispatchQueue.main.async {
                self?.showLoading()
            }
        }
        
        viewModel.hideLoadingView = { [weak self] in
            DispatchQueue.main.async {
                self?.hideLoading()
            }
        }
    }
    
    private func configureErrorViewActions() {
        errorView.tryAgainTap = { [weak self] in
            self?.viewModel.fetchPullRequests()
        }
    }
    
    private func configureTypedViewActions() {
        typedView.pullRequestCellTap = { [weak self] pullRequest in
            self?.coordinator.didFinish(url: pullRequest.url)
        }
        
        typedView.reloadPullRequests = { [weak self] in
            self?.viewModel.fetchPullRequests()
        }
    }
}

