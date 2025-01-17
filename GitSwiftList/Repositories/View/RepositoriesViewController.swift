//
//  RepositoriesViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import UIKit

final class RepositoriesViewController: UIViewController {
    
    private let typedView = RepositoriesView()
    
    override func loadView() {
        super.loadView()
        view = typedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Repositórios Swift"
    }
}
