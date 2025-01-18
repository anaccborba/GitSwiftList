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
    var showLoadingView: (() -> Void)?
    var hideLoadingView: (() -> Void)?
    
    private var isLoading = false
    private var currentPage = 1
    
    func fetchRepositories() {
        showLoadingView?()
        guard !isLoading else { return }
        isLoading = true
        service.fetchRepositories(page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.hideLoadingView?()
                self.isLoading = false
                
                switch result {
                case .success(let repositories):
                    self.repositories.append(contentsOf: repositories)
                    self.currentPage += 1
                    self.reloadRepositories?()
                    
                case .failure(_):
                    self.showErrorView?()
                }
            }
        }
    }
}
