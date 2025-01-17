//
//  SplashViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

final class SplashViewController: UIViewController {
    private let typedView = SplashView()
    
    override func loadView() {
        super.loadView()
        view = typedView
    }
}
