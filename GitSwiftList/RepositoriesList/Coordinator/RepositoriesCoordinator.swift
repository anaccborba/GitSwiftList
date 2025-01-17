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
        let viewController = RepositoriesViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
