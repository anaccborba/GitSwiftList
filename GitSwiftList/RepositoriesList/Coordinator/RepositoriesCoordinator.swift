//
//  RepositoriesCoordinator.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

final class RepositoriesCoordinator: Coordinator {
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RepositoriesViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func didFinish(repository: Repository) {
        let pullRequestsCoordinator = PullRequestsCoordinator(navigationController: self.navigationController)
        pullRequestsCoordinator.repository = repository
        pullRequestsCoordinator.start()
    }
}
