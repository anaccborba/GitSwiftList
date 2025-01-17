//
//  PullRequestsCoordinator.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

final class PullRequestsCoordinator: Coordinator {
    internal var navigationController: UINavigationController
    var repository: Repository?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let repository = self.repository {
            let viewModel = PullRequestsViewModel(repository: repository)
            let viewController = PullRequestsViewController(viewModel: viewModel, coordinator: self)
            navigationController.pushViewController(viewController, animated: false)
        }
    }
    
    func didFinish(url: String) {
        let pullRequestDetailWebView = PullRequestDetailWebView(url: url)
        navigationController.pushViewController(pullRequestDetailWebView, animated: false)
    }
}
