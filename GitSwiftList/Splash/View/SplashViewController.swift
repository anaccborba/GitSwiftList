//
//  SplashViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation
import UIKit

final class SplashViewController: UIViewController {
    private let typedView = SplashView()
    private let coordinator: SplashCoordinator
    
    init(coordinator: SplashCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func loadView() {
        super.loadView()
        view = typedView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            self?.coordinator.didFinish()
        }
    }
}
