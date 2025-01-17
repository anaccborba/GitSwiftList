//
//  RepositoriesViewController.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation
import UIKit

final class RepositoriesViewController: UIViewController {
    
    private let typedView = RepositoriesView()
    private let viewModel = RepositoriesViewModel()
    
    override func loadView() {
        super.loadView()
        view = typedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Repositórios Swift"
        
        viewModel.fetchRepositories()
        
        viewModel.reloadRepositories = { [weak self] in
            DispatchQueue.main.async {
                if let repositories = self?.viewModel.repositories {
                    self?.typedView.bindView(repositories: repositories)
                }
            }
        }
        
        viewModel.showErrorView = { [weak self] in
            DispatchQueue.main.async {
                print("error")
            }
        }
    }
}
