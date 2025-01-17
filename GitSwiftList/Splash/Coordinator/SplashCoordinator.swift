//
//  SplashCoordinator.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

final class SplashCoordinator: Coordinator {
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SplashViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func didFinish() {
        let repositoriesCoordinator = RepositoriesCoordinator(navigationController: self.navigationController)
        repositoriesCoordinator.start()
    }
}
