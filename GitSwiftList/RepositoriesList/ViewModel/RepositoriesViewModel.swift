//
//  RepositoriesViewModel.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation

class RepositoriesViewModel {
    private let service = RepositoriesService()
    private(set) var repositories: [Repository] = []
    var reloadRepositories: (() -> Void)?
    var showErrorView: (() -> Void)?
    
    func fetchRepositories() {
        service.fetchRepositories(page: 0, perPage: 10) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let repositories):
                    self.repositories.append(contentsOf: repositories)
                    self.reloadRepositories?()
                    
                case .failure(let error):
                    self.showErrorView?()
                }
            }
        }
    }
}
