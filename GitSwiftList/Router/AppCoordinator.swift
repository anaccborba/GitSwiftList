//
//  AppCoordinator.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        splashCoordinator.start()
    }
}
