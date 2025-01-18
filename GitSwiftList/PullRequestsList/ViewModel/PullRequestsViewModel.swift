//
//  PullRequestsViewModel.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 17/01/25.
//

import Foundation

class PullRequestsViewModel {
    private let repository: Repository
    private let service = PullRequestsService()
    private(set) var pullRequests: [PullRequest] = []
    var reloadPullRequests: (() -> Void)?
    var showErrorView: (() -> Void)?
    
    private var isLoading = false
    private var currentPage = 1
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func fetchPullRequests() {
        guard !isLoading else { return }
        isLoading = true
        service.fetchPullRequests(owner: repository.owner.login, repository: repository.name, page: currentPage) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                
                switch result {
                case .success(let pullRequests):
                    self.pullRequests.append(contentsOf: pullRequests)
                    self.currentPage += 1
                    self.reloadPullRequests?()
                    
                case .failure(_):
                    self.showErrorView?()
                }
            }
        }
    }
}

