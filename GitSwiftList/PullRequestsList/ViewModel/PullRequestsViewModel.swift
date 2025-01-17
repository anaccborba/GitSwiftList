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
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func fetchPullRequests() {
        service.fetchPullRequests(owner: repository.owner.login, repository: repository.name, page: 0, perPage: 10) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let pullRequests):
                    self.pullRequests.append(contentsOf: pullRequests)
                    self.reloadPullRequests?()
                    
                case .failure(let error):
                    self.showErrorView?()
                }
            }
        }
    }
}

